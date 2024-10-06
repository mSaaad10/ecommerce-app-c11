import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce_app/data/datasource_contract/products_datasource.dart';
import 'package:route_ecommerce_app/domain/entities/product_entity/ProductEntity.dart';
import 'package:route_ecommerce_app/domain/repository_contract/products_repository.dart';
@injectable
class GetMostSellingProductsUseCase{
  ProductsRepository mostSellingProductsRepo;
  @factoryMethod
  GetMostSellingProductsUseCase({required this.mostSellingProductsRepo});
  Future<Either<List<ProductEntity>, String>> call()=> mostSellingProductsRepo.getProducts(sort: ProductsSorting.MostSelling.sort);
}