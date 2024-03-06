

import 'package:mysql1/mysql1.dart';

abstract class DatabaseConnection {
  Future<MySqlConnection> openConnection();
}