import 'package:injectable/injectable.dart';

import 'package:cuidapet_api/entities/catogory.dart';
import 'package:cuidapet_api/modules/categories/data/i_categories_repository.dart';

import 'i_categories_service.dart';

@LazySingleton(as: ICategoriesService)
class CategoriesServiceImpl implements ICategoriesService {
  ICategoriesRepository repository;
  CategoriesServiceImpl({
    required this.repository,
  });
  
  @override
  Future<List<Category>> findAll()=> repository.findAll();

}
