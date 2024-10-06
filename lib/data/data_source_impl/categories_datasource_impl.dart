import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce_app/core/api/api_manager/api_manager.dart';
import 'package:route_ecommerce_app/core/api/end_points/end_points.dart';
import 'package:route_ecommerce_app/data/datasource_contract/categories_datasource.dart';
import 'package:route_ecommerce_app/data/model/categories_response/Categories_response.dart';
@Injectable(as: CategoriesDataSource)
class CategoriesDataSourceImpl extends CategoriesDataSource{

  ApiManger apiDataSource;
  @factoryMethod
  CategoriesDataSourceImpl({required this.apiDataSource});
  @override
  Future<Either<CategoriesResponse,String>> getCategories() async{
   try{
     var response = await  apiDataSource.getRequest(endPoint: EndPoints.categoriesEndPoint);
     CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(response.data);
     return Left(categoriesResponse);
   }catch(error){
     return Right(error.toString());
   }
  }

}