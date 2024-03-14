import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'lib/application/config/application_config.dart';
import 'package:shelf/shelf.dart' as shelf;

import 'lib/application/middlewares/cors/cors_middlewares.dart';
import 'lib/application/middlewares/defautContentype/default_content_type.dart';


//Configure routes.

Response _rootHandler(Request req) {
  return Response.ok('Hello, World. Modulo Api. Academia do Flutter!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

   // Application Config
  final router = Router();
  
  router.get('/health', (shelf.Request request) => shelf.Response.ok(jsonEncode({'up': 'true'})));

   final appConfig = ApplicationConfig();
  appConfig.loadConfigApplication(router);


  // Configure a pipeline that logs requests.
    final handler = const shelf.Pipeline()
      .addMiddleware(CorsMiddlewares().handler)
      .addMiddleware(DefaultContentType('application/json;charset=utf-8').handler)
  .addMiddleware(logRequests())
  .addHandler(router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
