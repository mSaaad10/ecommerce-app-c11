import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce_app/data/datasource_contract/products_datasource.dart';
import 'package:route_ecommerce_app/data/model/products_response/ProductModel.dart';
import 'package:route_ecommerce_app/domain/entities/product_entity/ProductEntity.dart';
import 'package:route_ecommerce_app/domain/repository_contract/products_repository.dart';
@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl extends ProductsRepository{

 ProductsDataSource productsDataSource;
 @factoryMethod
 ProductsRepositoryImpl({required this.productsDataSource});
  @override
  Future<Either<List<ProductEntity>, String>> getProducts({String? sort}) async{
    var response = await productsDataSource.getProducts();
   return response.fold((productsResponse) {
      List<ProductModel> productModelList = productsResponse.data ?? [];
      List<ProductEntity> productEntityList =
          productModelList.map((productModel) => productModel.toProductEntity(),).toList();

      return Left(productEntityList);
      }, (error) {
      return Right(error);
    },);
  }

}