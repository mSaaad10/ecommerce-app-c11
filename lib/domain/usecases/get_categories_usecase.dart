import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:route_ecommerce_app/domain/repository_contract/categories_repository.dart';
@injectable
class GetCategoriesUseCase{
  CategoriesRepository categoriesRepository;
  @factoryMethod
  GetCategoriesUseCase({required this.categoriesRepository});
  Future<Either<List<CategoryEntity>, String>>call(){
    return categoriesRepository.getCategories();
  }
}