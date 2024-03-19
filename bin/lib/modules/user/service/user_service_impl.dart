import '../../../application/logger/i_logger.dart';
import '../../../entities/user.dart';
import '../data/i_user_rpository.dart';
import '../view_models/user_save_input_model.dart';
import 'i_user_service.dart';
//@LazySingleton(as: IUserService)
class UserServiceImpl implements IUserService {
IUserRpository userRpository;
ILogger log;
  UserServiceImpl({
    required this.userRpository,
    required this.log,
  });

  

  @override
  Future<User> createUser(UserSaveInputModel user) {
   final userEntity=User(
    email: user.email,
    password: user.password,
    registerType: 'App',
    supplierId: user.supplierId
   );
   return userRpository.createUser(userEntity);
  }
}
