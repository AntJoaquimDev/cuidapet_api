import 'dart:async';
import 'dart:convert';

import 'package:cuidapet_api/application/exceptions/user_notfound_exception.dart';
import 'package:cuidapet_api/application/logger/i_logger.dart';
import 'package:cuidapet_api/modules/user/service/i_user_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';


part 'user_controller.g.dart';


@Injectable()
class UserController {
  IUserService userService;
  ILogger log;
  UserController({
    required this.userService,
    required this.log,
  });

  @Route.get('/')
  Future<Response> findByToken(Request request) async {
    try {
      final user = int.parse(request.headers['user']!);
      final userData = await userService.findById(user);
      return Response.ok(jsonEncode({
        'email': userData.email,
        'register_type': userData.registerType,
        'img_avatar': userData.imageAvatar
      }));
    } on UserNotFoundException {
      return Response(204);
    } catch (e, s) {
      log.error('Erro ao buscar usuário', e, s);
      return Response.internalServerError(
          body: jsonEncode({'message': 'Erro ao buscar usuário'}));
    }
  }

  Router get router => _$UserControllerRouter(this);
}
