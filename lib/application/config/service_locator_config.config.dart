// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../database/database_connection.dart' as _i5;
import '../../database/i_database_connection.dart' as _i4;
import '../../modules/categories/controller/categories_controllr.dart' as _i3;
import '../../modules/user/controller/auth_controller.dart' as _i13;
import '../../modules/user/controller/user_controller.dart' as _i12;
import '../../modules/user/data/i_user_repository.dart' as _i7;
import '../../modules/user/data/user_repository_impl.dart' as _i8;
import '../../modules/user/service/i_user_service.dart' as _i10;
import '../../modules/user/service/user_service_impl.dart' as _i11;
import '../logger/i_logger.dart' as _i9;
import 'database_connection_configuration.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.CategoriesControllr>(() => _i3.CategoriesControllr());
  gh.lazySingleton<_i4.IDatabaseConnection>(
      () => _i5.DatabaseConnection(get<_i6.DatabaseConnectionConfiguration>()));
  gh.lazySingleton<_i7.IUserRepository>(() => _i8.UserRpositoryImpl(
        connection: get<_i4.IDatabaseConnection>(),
        log: get<_i9.ILogger>(),
      ));
  gh.lazySingleton<_i10.IUserService>(() => _i11.UserServiceImpl(
        userRepository: get<_i7.IUserRepository>(),
        log: get<_i9.ILogger>(),
      ));
  gh.factory<_i12.UserController>(() => _i12.UserController(
        userService: get<_i10.IUserService>(),
        log: get<_i9.ILogger>(),
      ));
  gh.factory<_i13.AuthController>(() => _i13.AuthController(
        userService: get<_i10.IUserService>(),
        log: get<_i9.ILogger>(),
      ));
  return get;
}
