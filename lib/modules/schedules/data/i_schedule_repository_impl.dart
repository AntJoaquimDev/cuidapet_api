import 'package:cuidapet_api/application/exceptions/database_exceptions.dart';
import 'package:injectable/injectable.dart';

import 'package:cuidapet_api/application/logger/i_logger.dart';
import 'package:cuidapet_api/database/i_database_connection.dart';
import 'package:cuidapet_api/entities/schedule.dart';
import 'package:mysql1/mysql1.dart';

import 'i_schedule_repository.dart';

@LazySingleton(as: IScheduleRepository)
class IScheduleRepositoryImpl implements IScheduleRepository {
  IDatabaseConnection connection;
  ILogger log;
  IScheduleRepositoryImpl({
    required this.connection,
    required this.log,
  });

  @override
  Future<void> save(Schedule schedule) async {
    MySqlConnection? conn;
    try {
      conn = await connection.openConnection();

      await conn.transaction((_) async {
        final result = await conn!.query(
          '''insert into
            agendamento(data_agendamento, usuario_id, fornecedor_id, status, nome, nome_pet) 
          values(
            ?,?,?,?,?,?)''', [
          schedule.scheduleDate.toIso8601String(),
          schedule.userId,
          schedule.supplier.id,
          schedule.status,
          schedule.name,
          schedule.petName,
        ]);
        final scheduleId = result.insertId;

        if (scheduleId != null) {
          await conn.queryMulti('''
            insert into agendamento_servicos values(?, ?)
          ''', schedule.services.map((s) => [scheduleId, s.service.id]));
        }
      });
    } on MySqlException catch (e, s) {
      log.error('Erro ao agendar servico', e, s);
      throw DatabaseException();
    } finally {
      await conn?.close();
    }
  }
}
