// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_controller.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$SupplierControllerRouter(SupplierController service) {
  final router = Router();
  router.add(
    'GET',
    r'/',
    service.findNearByMe,
  );
  router.add(
    'GET',
    r'/<id|[0-9]+>',
    service.findById,
  );
  return router;
}
