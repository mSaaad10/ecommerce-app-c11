import 'package:dartz/dartz.dart';
import 'package:route_ecommerce_app/domain/entities/BrandEntity.dart';

abstract class BrandsRepository {
  Future<Either<List<BrandEntity>, String>> getBrands();
}
