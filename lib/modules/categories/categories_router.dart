
import 'package:cuidapet_api/houters/i_router.dart';
import 'package:cuidapet_api/modules/categories/controller/categories_controllr.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf_router/src/router.dart';

class CategoriesRouter implements IRouter{

  final categoryController=GetIt.I.get<CategoriesControllr>();
  @override
  void configure(Router router) {
    router.mount('/categories/',categoryController.router);
  }
  
}