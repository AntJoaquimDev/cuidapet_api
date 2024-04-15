import 'package:get_it/get_it.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

import '../config/application_config.dart';

final env = GetIt.I.get<ApplicationConfig>().env;

class JwtHelper {
  static final String _jwtSecret = env['JWT_SECRET'] ?? env['jwtSecret']!;
  JwtHelper._();
static String generateJWT(int userId, int? supplierId) {
    final expire = int.parse(env['JWT_EXPIRE'] ?? env['jwtExpire']!);

    final claimSet = JwtClaim(
        issuer: 'cuidapet',
        subject: userId.toString(),
        expiry: DateTime.now().add(Duration(days: expire)),
        //expiry: DateTime.now().add(Duration(seconds: 30)),
        notBefore: DateTime.now(),
        issuedAt: DateTime.now(),
        otherClaims: <String, dynamic>{'supplier': supplierId},
        maxAge: Duration(days: expire));

    return 'Bearer ${issueJwtHS256(claimSet, _jwtSecret)}';
  }


  static JwtClaim getClaims(String token) {
    return verifyJwtHS256Signature(token, _jwtSecret);
  }
}
