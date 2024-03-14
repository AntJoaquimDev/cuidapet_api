import 'dart:async';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'teste_controller.g.dart';

class TesteController {

   @Route.get('/')
   Future<Response> find(Request request) async { 
      return Response.ok(jsonEncode({'ola Mundo' :'joaquim'}),headers:{'content-type':'aplication/json'} );
   }

   Router get router => _$TesteControllerRouter(this);
}