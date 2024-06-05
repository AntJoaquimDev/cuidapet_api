import 'dart:async';
import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'categories_controllr.g.dart';
@Injectable()
class CategoriesControllr {

   @Route.get('/')
   Future<Response> find(Request request) async { 
      return Response.ok(jsonEncode(''));
   }

   Router get router => _$CategoriesControllrRouter(this);
}