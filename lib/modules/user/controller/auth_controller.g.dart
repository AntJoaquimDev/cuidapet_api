// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$AuthControllerRouter(AuthController service) {
  final router = Router();
  router.add(
    'GET',
    r'/find/',
    service.find,
  );
  router.add(
    'POST',
    r'/',
    service.login,
  );
  router.add(
    'POST',
    r'/register',
    service.saveUser,
  );
  router.add(
    'PATCH',
    r'/auth/confirm',
    service.confirmLogin,
  );
  return router;
}
