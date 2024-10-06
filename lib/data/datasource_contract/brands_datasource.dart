import 'package:dartz/dartz.dart';
import 'package:route_ecommerce_app/data/model/brands_response/BrandsResponse.dart';

abstract class BrandsDataSource{
  Future<Either<BrandsResponse, String>>getBrands();
}