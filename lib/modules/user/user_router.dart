

import 'package:cuidapet_api/houters/i_router.dart';
import 'package:cuidapet_api/modules/user/controller/auth_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf_router/shelf_router.dart';

class Userouter implements IRouter{
  @override
  void configure(Router router) {
  final authController = GetIt.I.get<AuthController>();
  router.mount('/auth/', authController.router);
  }
 
}