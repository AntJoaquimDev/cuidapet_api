// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../database/database_connection.dart' as _i4;
import '../../database/i_database_connection.dart' as _i3;
import '../../modules/categories/controller/categories_controllr.dart' as _i22;
import '../../modules/categories/data/categories_repository_impl.dart' as _i16;
import '../../modules/categories/data/i_categories_repository.dart' as _i15;
import '../../modules/categories/service/i_categories_service.dart' as _i17;
import '../../modules/categories/service/i_categories_service_impl.dart'
    as _i18;
import '../../modules/supplier/controller/supplier_controller.dart' as _i21;
import '../../modules/supplier/data/i_supplier_repository.dart' as _i6;
import '../../modules/supplier/data/i_supplier_repository_impl.dart' as _i7;
import '../../modules/supplier/service/i_supplier_service.dart' as _i19;
import '../../modules/supplier/service/i_supplier_service_impl.dart' as _i20;
import '../../modules/user/controller/auth_controller.dart' as _i14;
import '../../modules/user/controller/user_controller.dart' as _i13;
import '../../modules/user/data/i_user_repository.dart' as _i9;
import '../../modules/user/data/user_repository_impl.dart' as _i10;
import '../../modules/user/service/i_user_service.dart' as _i11;
import '../../modules/user/service/user_service_impl.dart' as _i12;
import '../logger/i_logger.dart' as _i8;
import 'database_connection_configuration.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.IDatabaseConnection>(
      () => _i4.DatabaseConnection(get<_i5.DatabaseConnectionConfiguration>()));
  gh.lazySingleton<_i6.ISupplierRepository>(() => _i7.ISupplierRepositoryImpl(
        connection: get<_i3.IDatabaseConnection>(),
        log: get<_i8.ILogger>(),
      ));
  gh.lazySingleton<_i9.IUserRepository>(() => _i10.UserRpositoryImpl(
        connection: get<_i3.IDatabaseConnection>(),
        log: get<_i8.ILogger>(),
      ));
  gh.lazySingleton<_i11.IUserService>(() => _i12.UserServiceImpl(
        userRepository: get<_i9.IUserRepository>(),
        log: get<_i8.ILogger>(),
      ));
  gh.factory<_i13.UserController>(() => _i13.UserController(
        userService: get<_i11.IUserService>(),
        log: get<_i8.ILogger>(),
      ));
  gh.factory<_i14.AuthController>(() => _i14.AuthController(
        userService: get<_i11.IUserService>(),
        log: get<_i8.ILogger>(),
      ));
  gh.lazySingleton<_i15.ICategoriesRepository>(
      () => _i16.CategoriesRepositoryImpl(
            connection: get<_i3.IDatabaseConnection>(),
            log: get<_i8.ILogger>(),
          ));
  gh.lazySingleton<_i17.ICategoriesService>(() => _i18.CategoriesServiceImpl(
      repository: get<_i15.ICategoriesRepository>()));
  gh.lazySingleton<_i19.ISupplierService>(() => _i20.ISupplierServiceImpl(
        repository: get<_i6.ISupplierRepository>(),
        service: get<_i11.IUserService>(),
      ));
  gh.factory<_i21.SupplierController>(() => _i21.SupplierController(
        service: get<_i19.ISupplierService>(),
        log: get<_i8.ILogger>(),
      ));
  gh.factory<_i22.CategoriesControllr>(
      () => _i22.CategoriesControllr(service: get<_i17.ICategoriesService>()));
  return get;
}
