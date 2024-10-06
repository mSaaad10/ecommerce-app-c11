import 'package:dartz/dartz.dart';
import 'package:route_ecommerce_app/data/model/products_response/ProductsResponse.dart';

abstract class ProductsDataSource{
  Future<Either<ProductsResponse, String>>getProducts({String?  sort});
}


enum ProductsSorting{

  MostSelling('-sold'),
  LeastSelling('sold'),
  AscendingPrice('-price'),
  DescendingPrice('price');
  final String sort;
  const ProductsSorting(this.sort);
}