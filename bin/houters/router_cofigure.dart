
import 'package:shelf_router/shelf_router.dart';

import '../lib/modules/user/user_router.dart';
import 'i_router.dart';

class RouterCofigure {
  final Router _router;
 
  final List<IRouter>_routers=[
    Userouter(),
  ];

   RouterCofigure(this._router);

   void configur()=> _routers.forEach((r) =>r.configure(_router));
}
