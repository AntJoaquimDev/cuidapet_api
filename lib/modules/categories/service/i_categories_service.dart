import 'package:cuidapet_api/entities/catogory.dart';

abstract class ICategoriesService {
 Future<List<Category>> findAll();
}