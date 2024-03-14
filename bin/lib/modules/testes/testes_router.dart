
import 'package:shelf_router/src/router.dart';

import '../../../houters/i_router.dart';
import 'teste_controller.dart';

class TestesRouter implements IRouter{
  @override
  void configure(Router router) {
   router.mount('/hello/', TesteController().router);
   
  }
  
}