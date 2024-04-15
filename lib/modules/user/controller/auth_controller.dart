import 'dart:async';
import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../application/exceptions/user_exists_exception.dart';
import '../../../application/logger/i_logger.dart';
import '../service/i_user_service.dart';
import '../view_models/user_save_input_model.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController {
  IUserService userService;
  ILogger log;

  AuthController({
    required this.userService,
    required this.log,
  });

   @Route.get('/')
   Future<Response> find(Request request) async { 
      return Response.ok(jsonEncode({'OLa mundo!':'Todos os cadastros ok'}));
   }
   @Route.get('/')
   Future<Response> login(Request request) async { 
      return Response.ok(jsonEncode({''}));
   }

   

  @Route.post('/register')
  Future<Response> saveUser(Request request) async {
    try {
      final userModel = UserSaveInputModel.requestMapping(await request.readAsString());
      await userService.createUser(userModel);
      return Response.ok(
          jsonEncode({'message': 'cadastro realizado com sucesso'}));
    } on UserExistsException {
      return Response(400,
          body: jsonEncode(
              {'message': 'Usuário já cadastrado na base de dados'}));
    } catch (e) {
      log.error('Erro ao cadastrar usuário', e);
      return Response.internalServerError();
    }
  }
  Router get router => _$AuthControllerRouter(this);
}