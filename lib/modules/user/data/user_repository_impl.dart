import 'package:cuidapet_api/modules/user/data/i_user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

import '../../../application/exceptions/database_exceptions.dart';
import '../../../application/exceptions/user_exists_exception.dart';
import '../../../application/logger/i_logger.dart';
import '../../../application/helpers/cripty_helper.dart';
import '../../../database/i_database_connection.dart';
import '../../../entities/user.dart';

@LazySingleton(as: IUserRepository)
class UserRpositoryImpl implements IUserRepository {
  final IDatabaseConnection connection;
  final ILogger log;
  UserRpositoryImpl({
    required this.connection,
    required this.log,
  });

  @override
  Future<User> createUser(User user) async {
    late final MySqlConnection? conn;
    try {
      conn = await connection.openConnection();
      final query = '''
            insert usuario(email, tipo_cadastro, img_avatar, senha, fornecedor_id, social_id)
                   values(?,?,?,?,?,?)
      ''';
      final result = await conn.query(query, [
        user.email,
        user.registerType,
        user.imageAvatar,
        CriptyHelper.generateSha256Hash(user.password ?? ''),
        user.supplierId,
        user.socialKey
      ]);

      final userId = result.insertId;
      return user.copyWith(id: userId, password: '');
      
    } on MySqlException catch (e, s) {
      if (e.message.contains('usuario.email_UNIQUE')) {
        log.error('Usuario ja cadastrado na base de dados', e, s);
        throw UserExistsException();
      }
      log.error('Erro ao criar usuario', e, s);
      throw DatabaseException(message: 'Erro ao criar usuario', exception: e);
    } finally {
      await conn?.close();
    }
  }
}
