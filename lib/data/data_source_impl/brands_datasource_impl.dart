import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce_app/core/api/api_manager/api_manager.dart';
import 'package:route_ecommerce_app/core/api/end_points/end_points.dart';
import 'package:route_ecommerce_app/data/datasource_contract/brands_datasource.dart';
import 'package:route_ecommerce_app/data/model/brands_response/BrandsResponse.dart';
@Injectable(as: BrandsDataSource)
class BrandsDataSourceImpl extends BrandsDataSource{

 ApiManger apiManger;
 @factoryMethod
 BrandsDataSourceImpl({required this.apiManger});
  @override
  Future<Either<BrandsResponse, String>> getBrands()async {
    try{
      var response = await apiManger.getRequest(endPoint: EndPoints.brandsEndPoint);
   BrandsResponse brandsResponse = BrandsResponse.fromJson(response.data);
     return Left(brandsResponse);
    }catch(error){
      return Right(error.toString());
    }
  }

}