import 'dart:async';
import 'dart:convert';
import 'package:cuidapet_api/application/logger/i_logger.dart';
import 'package:cuidapet_api/entities/catogory.dart';
import 'package:cuidapet_api/entities/supplier.dart';
import 'package:cuidapet_api/modules/supplier/service/i_supplier_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'supplier_controller.g.dart';
@Injectable()
class SupplierController {
ISupplierService service;
  ILogger log;

  SupplierController({
    required this.service,
    required this.log,
  });

   @Route.get('/')
   Future<Response> findNearByMe(Request request) async { 
     try {
  final lat = double.tryParse(request.url.queryParameters['lat'] ?? '');
   final lng = double.tryParse(request.url.queryParameters['lng'] ?? '');
   if(lat == null|| lng ==null){
     return Response(
       400,
       body: jsonEncode(
         {'message':'Latitude e Longitude obrigatórios'},
       )
     );
   
   }
final suppliers= await service.findNearByMe(lat, lng);
final result = suppliers
          .map((s) => {
                'id': s.id,
                'name': s.name,
                'logo': s.logo,
                'distance': s.distance,
                'category': s.categoryId,
              })
          .toList();
   return Response.ok(jsonEncode(result));
} catch (e, s) {
      log.error('Erro ao buscar fornecedores perto de mim', e, s);
      return Response.internalServerError(
          body: jsonEncode(
              {'message': 'Erro ao buscar fornecedores perto de mim'}));
    }
   }

 @Route.get('/<id|[0-9]+>')
  Future<Response> findById(Request request, String id) async {
    final supplier = await service.findById(int.parse(id));

    if (supplier == null) {
      return Response.ok(jsonEncode({'message':'não existe forncedor com esse id =, $id'}));
    }

    return Response.ok(_supplierMapper(supplier));
  }
   
String _supplierMapper(Supplier supplier) {
    return jsonEncode({
      'id': supplier.id,
      'name': supplier.name,
      'logo': supplier.logo,
      'address': supplier.address,
      'phone': supplier.phone,
      'latitude': supplier.lat,
      'longitude': supplier.lng,
      'category': {
        'id': supplier.category?.id,
        'name': supplier.category?.name,
        'type': supplier.category?.type,
      },
    });
  }

   

   Router get router => _$SupplierControllerRouter(this);
}