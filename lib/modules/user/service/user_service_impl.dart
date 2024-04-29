//@LazySingleton(as: IUserService)
import 'package:cuidapet_api/application/exceptions/user_notfound_exception.dart';
import 'package:cuidapet_api/application/logger/i_logger.dart';
import 'package:cuidapet_api/entities/user.dart';
import 'package:cuidapet_api/modules/user/data/i_user_repository.dart';
import 'package:cuidapet_api/modules/user/service/i_user_service.dart';
import 'package:cuidapet_api/modules/user/view_models/user_save_input_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IUserService)
class UserServiceImpl implements IUserService {
  IUserRepository userRepository;
  ILogger log;
  UserServiceImpl({
    required this.userRepository,
    required this.log,
  });

  @override
  Future<User> loginWithEmailPassword(
          String email, String password, bool supplierUser) =>
      userRepository.loginWithEmailPassword(email, password, supplierUser);

  
  @override
  Future<User> loginWithSocial(
    String email, String? avatar, String socialType, String socialKey) async{
   try {
  return await userRepository.loginByEmailSocialKey(email, socialKey, socialType);
} on UserNotFoundException catch (e) {
  log.error('Usuário não encontrando, criando um usuário', e);
  final user = User(
        email: email,
        imageAvatar: avatar,
        registerType: socialType,
        socialKey: socialKey,
        password: DateTime.now().toString(),
      );
      return await userRepository.createUser(user);
    }
  
  }


  @override
  Future<User> createUser(UserSaveInputModel user) {
    final userEntity = User(
        email: user.email,
        password: user.password,
        registerType: 'App',
        supplierId: user.supplierId);
    return userRepository.createUser(userEntity);
  }
}
