import 'package:cuidapet_api/entities/schedule.dart';

abstract class IScheduleRepository {
Future<void>save(Schedule schedule);
}