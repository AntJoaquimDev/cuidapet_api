import 'package:cuidapet_api/entities/catogory.dart';
import 'package:cuidapet_api/modules/user/view_models/user_save_input_model.dart';
import 'package:injectable/injectable.dart';

import 'package:cuidapet_api/application/dtos/supplier_nearby_me_dto.dart';
import 'package:cuidapet_api/entities/supplier.dart';
import 'package:cuidapet_api/entities/supplier_service.dart' as entite;
import 'package:cuidapet_api/modules/supplier/data/i_supplier_repository.dart';
import 'package:cuidapet_api/modules/supplier/view_models/create_supplier_user_view_model.dart';
import 'package:cuidapet_api/modules/supplier/view_models/supplier_update_input_model.dart';
import 'package:cuidapet_api/modules/user/service/i_user_service.dart';

import './i_supplier_service.dart';

@LazySingleton(as: ISupplierService)
class ISupplierServiceImpl implements ISupplierService {
  final ISupplierRepository repository;
  final IUserService userService;

  static const DISTANCE = 5;
  ISupplierServiceImpl({required this.repository, required this.userService});

  @override
  Future<Supplier?> findById(int id) => repository.findById(id);

  @override
  Future<List<entite.SupplierService>> findServicesBySupplier(int supplierId) =>
      repository.findServicesBySupplierId(supplierId);

  @override
  Future<bool> checkUserEmailsExists(String email) =>
      repository.checkUserEmailExists(email);

  @override
  Future<List<SupplierNearbyMeDTO>> findNearByMe(double lat, double lng) =>
      repository.findNearByPosition(lat, lng, DISTANCE);

  @override
  Future<void> createUserSupplier(CreateSupplierUserViewModel model) async {
    final supplierEntity = Supplier(
      name: model.supplierName,
      category: Category(id: model.category),
    );
    final supplierId = await repository.saveSupplier(supplierEntity);
    final userInputModel = UserSaveInputModel(
        email: model.email, password: model.password, supplierId: supplierId);
    await userService.createUser(userInputModel);
    
  }

  @override
  Future<Supplier> update(SupplierUpdateInputModel model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
