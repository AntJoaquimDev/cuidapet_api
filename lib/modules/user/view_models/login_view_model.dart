import 'package:cuidapet_api/application/helpers/request_mapping.dart';

class LoginViewModel extends RequestMapping {
  late String login;
  late String password;
  late bool socialLogin;
  late bool supplierUser;

  LoginViewModel(String dataRequest) : super(dataRequest);
  @override
  void map() {
   login = data['login'];
    password = data['password'];
    socialLogin = data['social_login'];
    supplierUser = data['supplier_user'];
  }
}
