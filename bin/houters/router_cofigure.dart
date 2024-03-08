
import 'package:shelf_router/shelf_router.dart';

import '../lib/modules/testes/testes_router.dart';
import 'i_router.dart';

class RouterCofigure {
  final Router _router;
 
  final List<IRouter>_routers=[
    TestesRouter(),
  ];

   RouterCofigure(this._router);

   void configur()=> _routers.forEach((r) =>r.configure(_router));
}
