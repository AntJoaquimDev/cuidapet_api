import 'package:cuidapet_api/houters/i_router.dart';
import 'package:cuidapet_api/modules/supplier/controller/supplier_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf_router/src/router.dart';

class SupplierRoute implements IRouter {
  @override
  void configure(Router router) {
    final supplierController = GetIt.I.get<SupplierController>();

    router.mount('/suppliers/', supplierController.router);
  }
}
