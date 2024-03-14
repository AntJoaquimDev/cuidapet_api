import 'package:get_it/get_it.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

import '../../config/application_config.dart';

final env = GetIt.I.get<ApplicationConfig>().env;

class JwtHelper {
  static final String _jwtSecret = env['JWT_SECRET'] ?? env['jwtSecret']!;
  JwtHelper._();
  static JwtClaim getClaims(String token) {
    return verifyJwtHS256Signature(token, _jwtSecret);
  }
}
