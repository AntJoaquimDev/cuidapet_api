import '../../../entities/user.dart';

abstract interface class IUserRpository {

Future<User>createUser(User user);
}