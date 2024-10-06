import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce_app/core/api/api_manager/api_manager.dart';
import 'package:route_ecommerce_app/core/api/end_points/end_points.dart';
import 'package:route_ecommerce_app/data/datasource_contract/products_datasource.dart';
import 'package:route_ecommerce_app/data/model/products_response/ProductsResponse.dart';

@Injectable(as: ProductsDataSource)
class ProductsDataSourceImpl extends ProductsDataSource {
  ApiManger apiManger;

  @factoryMethod
  ProductsDataSourceImpl({required this.apiManger});

  @override
  Future<Either<ProductsResponse, String>> getProducts({String? sort})async {
   try{
     var response = await apiManger.getRequest(
         endPoint: EndPoints.productsEndPoint, queryParameters: {
       'sort': sort,
     });
     ProductsResponse productsResponse = ProductsResponse.fromJson(response.data);
     return Left(productsResponse);
   }catch(error){
     return Right(error.toString());
   }
  }

}
