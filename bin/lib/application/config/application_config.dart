
import 'package:dotenv/dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../houters/router_cofigure.dart';
import '../logger/logger.dart';
import 'database_connection_configuration.dart';
import 'service_locator_config.dart';


GetIt getIt = GetIt.I;

class ApplicationConfig {

  late final DotEnv _env;

  Future<void> loadConfigApplication(Router router) async {
    _env = await _loadEnv();
    
    _loadDatabaseConfig();
    _configLogger();
    _loadDependencies();
    _loadRoutersConfigure(router);
  }

  Future<DotEnv> _loadEnv() async => DotEnv(includePlatformEnvironment: true)..load();

  void _loadDatabaseConfig() {
    
    final databaseConfig = DatabaseConnectionConfiguration(
      host: _env['DATABASE_HOST'] ?? _env['databaseHost']!,
      user: _env['DATABASE_USER'] ?? _env['databaseUser']!,
      port: int.tryParse(_env['DATABASE_PORT'] ?? _env['databasePort']!) ?? 0,
      password: _env['DATABASE_PASSWORD'] ?? _env['databasePassword']!,
      databaseName: _env['DATABASE_NAME'] ?? _env['databaseName']!,
    );

   getIt.registerSingleton(databaseConfig);
  }

  void _configLogger() =>
      getIt.registerLazySingleton<Logger>(() => Logger());

  void _loadDependencies() => configureDependencies();

  void _loadRoutersConfigure(Router router) => RouterCofigure(router).configur();

   DotEnv get env => _env;
}