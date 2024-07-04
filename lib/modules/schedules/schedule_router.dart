
import 'package:cuidapet_api/houters/i_router.dart';
import 'package:cuidapet_api/modules/schedules/controller/schedule_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf_router/src/router.dart';

class ScheduleRouter implements IRouter{
  @override
  void configure(Router router) {
    final scheduleConroller = GetIt.I<ScheduleController>();
  router.mount('/schedules/', scheduleConroller.router);
  
  }
  
}