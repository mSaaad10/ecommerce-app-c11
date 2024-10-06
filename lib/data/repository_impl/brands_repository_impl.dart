import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce_app/data/datasource_contract/brands_datasource.dart';
import 'package:route_ecommerce_app/data/model/brands_response/BrandModel.dart';
import 'package:route_ecommerce_app/domain/entities/BrandEntity.dart';
import 'package:route_ecommerce_app/domain/repository_contract/brands_repository.dart';
@Injectable(as:BrandsRepository)
class BrandsRepositoryImpl extends BrandsRepository{
  BrandsDataSource brandsDataSource;
  @factoryMethod
  BrandsRepositoryImpl({required this.brandsDataSource});
  @override
  Future<Either<List<BrandEntity>, String>> getBrands() async{
   var response = await brandsDataSource.getBrands();
   return response.fold((brandsResponse) {
     List<BrandModel> brandModelList = brandsResponse.data ?? [];
     List<BrandEntity> brandEntityList = brandModelList.map((brandModel) => brandModel.toBrandEntity()).toList();
     return Left(brandEntityList);
   }, (error) {
     return Right(error);
   },);
  }
}