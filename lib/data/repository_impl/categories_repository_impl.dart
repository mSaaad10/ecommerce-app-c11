import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce_app/data/datasource_contract/categories_datasource.dart';
import 'package:route_ecommerce_app/data/model/categories_response/CategoryModel.dart';
import 'package:route_ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:route_ecommerce_app/domain/repository_contract/categories_repository.dart';
@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl extends CategoriesRepository {
  CategoriesDataSource categoriesDataSource;
  @factoryMethod
  CategoriesRepositoryImpl({required this.categoriesDataSource});

  @override
  Future<Either<List<CategoryEntity>, String>> getCategories() async {
    var result = await categoriesDataSource.getCategories();
    return result.fold(
      (categoriesResponse) {
        List<CategoryModel> categoryModelList = categoriesResponse.data ?? [];
        List<CategoryEntity> categoryEntityList = categoryModelList
            .map(
              (categoryModel) => categoryModel.toCategoryEntity(),
            )
            .toList();
        return Left(categoryEntityList);
      },
      (error) {
        return Right(error.toString());
      },
    );
  }
}
