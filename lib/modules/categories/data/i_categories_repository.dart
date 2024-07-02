

 import 'package:cuidapet_api/entities/catogory.dart';

abstract class ICategoriesRepository {
  Future<List<Category>> findAll();
 }