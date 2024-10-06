import 'package:dartz/dartz.dart';
import 'package:route_ecommerce_app/domain/entities/product_entity/ProductEntity.dart';

abstract class ProductsRepository{
  Future<Either<List<ProductEntity>, String>>getProducts({String? sort});
}