import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce_app/domain/entities/BrandEntity.dart';
import 'package:route_ecommerce_app/domain/repository_contract/brands_repository.dart';
@injectable
class GetBrandsUseCase{
  BrandsRepository brandsRepository;
  GetBrandsUseCase({required this.brandsRepository});
  Future<Either<List<BrandEntity>, String>> call()=> brandsRepository.getBrands();
}