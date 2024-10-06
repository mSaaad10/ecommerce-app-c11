import 'package:dartz/dartz.dart';
import 'package:route_ecommerce_app/data/model/categories_response/Categories_response.dart';

abstract class CategoriesDataSource{
  Future<Either<CategoriesResponse,String>>getCategories();
}