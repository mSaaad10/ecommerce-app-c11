import 'package:dartz/dartz.dart';
import 'package:route_ecommerce_app/data/model/categories_response/Categories_response.dart';
import 'package:route_ecommerce_app/domain/entities/CategoryEntity.dart';

abstract class CategoriesRepository{
  Future<Either<List<CategoryEntity>, String>>getCategories();
}