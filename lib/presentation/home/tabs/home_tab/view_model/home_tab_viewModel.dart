import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce_app/domain/entities/BrandEntity.dart';
import 'package:route_ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:route_ecommerce_app/domain/entities/product_entity/ProductEntity.dart';
import 'package:route_ecommerce_app/domain/usecases/get_brands_usecase.dart';
import 'package:route_ecommerce_app/domain/usecases/get_categories_usecase.dart';
import 'package:route_ecommerce_app/domain/usecases/most_selling_products.dart';
@injectable
class HomeTabViewModel extends Cubit<HomeTabState> {
  @factoryMethod
  HomeTabViewModel({required this.categoriesUseCase, required this.brandsUseCase, required this.mostSellingProductsUseCase})
      : super(HomeTabInitialState());
  GetCategoriesUseCase categoriesUseCase;
  GetBrandsUseCase brandsUseCase;
  GetMostSellingProductsUseCase mostSellingProductsUseCase;

  void getCategories() async {

    emit(CategoriesLoadingState());
    var result = await categoriesUseCase.call();
    result.fold(
      (categoriesList) {
        emit(CategoriesSuccessState(categories: categoriesList));
      },
      (error) {
        emit(CategoriesErrorState(error: error));
      },
    );
  }

  void getBrands()async{
    emit(BrandsLoadingState());
    var result = await brandsUseCase.call();
    result.fold((brands) {
      emit(BrandsSuccessState(brands: brands));
    }, (error) {
      emit(BrandsErrorState(errorMessage: error));
    },);

  }

  void getMostSellingProducts()async{
    emit(MostSellingProductsLoadingState());
    var result = await mostSellingProductsUseCase.call();
    result.fold((products) {
      emit(MostSellingProductsSuccessState(products: products));
    }, (error) {
      emit( MostSellingProductsErrorState(errorMessage: error));
    },);

  }
}

sealed class HomeTabState {}

class HomeTabInitialState extends HomeTabState {}

class CategoriesLoadingState extends HomeTabState {
  String? loadingMessage;

  CategoriesLoadingState({this.loadingMessage});
}

class CategoriesErrorState extends HomeTabState {
  String error;

  CategoriesErrorState({required this.error});
}

class CategoriesSuccessState extends HomeTabState {
  List<CategoryEntity> categories;

  CategoriesSuccessState({required this.categories});
}

class BrandsLoadingState extends HomeTabState{
  String? loadingMessage;
  BrandsLoadingState({this.loadingMessage});
}
class BrandsErrorState extends HomeTabState{
  String errorMessage;
  BrandsErrorState({required this.errorMessage});
}
class BrandsSuccessState extends HomeTabState{
  List<BrandEntity> brands;
  BrandsSuccessState({required this.brands});
}
class MostSellingProductsLoadingState extends HomeTabState{
 String? loadingMessage;
 MostSellingProductsLoadingState({this.loadingMessage});
}
class MostSellingProductsErrorState extends HomeTabState{
  String errorMessage;
  MostSellingProductsErrorState({required this.errorMessage});
}

class MostSellingProductsSuccessState extends HomeTabState{
  List<ProductEntity> products;
  MostSellingProductsSuccessState({required this.products});
}