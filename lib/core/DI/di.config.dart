// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_source_impl/brands_datasource_impl.dart' as _i887;
import '../../data/data_source_impl/categories_datasource_impl.dart' as _i260;
import '../../data/data_source_impl/products_datasource_impl.dart' as _i899;
import '../../data/datasource_contract/brands_datasource.dart' as _i912;
import '../../data/datasource_contract/categories_datasource.dart' as _i546;
import '../../data/datasource_contract/products_datasource.dart' as _i550;
import '../../data/repository_impl/brands_repository_impl.dart' as _i902;
import '../../data/repository_impl/categories_repository_impl.dart' as _i687;
import '../../data/repository_impl/products_repository_impl.dart' as _i301;
import '../../domain/repository_contract/brands_repository.dart' as _i81;
import '../../domain/repository_contract/categories_repository.dart' as _i520;
import '../../domain/repository_contract/products_repository.dart' as _i582;
import '../../domain/usecases/get_brands_usecase.dart' as _i717;
import '../../domain/usecases/get_categories_usecase.dart' as _i943;
import '../../domain/usecases/most_selling_products.dart' as _i7;
import '../../presentation/home/tabs/home_tab/view_model/home_tab_viewModel.dart'
    as _i1011;
import '../api/api_manager/api_manager.dart' as _i680;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i680.ApiManger>(() => _i680.ApiManger());
    gh.factory<_i550.ProductsDataSource>(
        () => _i899.ProductsDataSourceImpl(apiManger: gh<_i680.ApiManger>()));
    gh.factory<_i912.BrandsDataSource>(
        () => _i887.BrandsDataSourceImpl(apiManger: gh<_i680.ApiManger>()));
    gh.factory<_i546.CategoriesDataSource>(() =>
        _i260.CategoriesDataSourceImpl(apiDataSource: gh<_i680.ApiManger>()));
    gh.factory<_i81.BrandsRepository>(() => _i902.BrandsRepositoryImpl(
        brandsDataSource: gh<_i912.BrandsDataSource>()));
    gh.factory<_i520.CategoriesRepository>(() => _i687.CategoriesRepositoryImpl(
        categoriesDataSource: gh<_i546.CategoriesDataSource>()));
    gh.factory<_i943.GetCategoriesUseCase>(() => _i943.GetCategoriesUseCase(
        categoriesRepository: gh<_i520.CategoriesRepository>()));
    gh.factory<_i717.GetBrandsUseCase>(() =>
        _i717.GetBrandsUseCase(brandsRepository: gh<_i81.BrandsRepository>()));
    gh.factory<_i582.ProductsRepository>(() => _i301.ProductsRepositoryImpl(
        productsDataSource: gh<_i550.ProductsDataSource>()));
    gh.factory<_i7.GetMostSellingProductsUseCase>(() =>
        _i7.GetMostSellingProductsUseCase(
            mostSellingProductsRepo: gh<_i582.ProductsRepository>()));
    gh.factory<_i1011.HomeTabViewModel>(() => _i1011.HomeTabViewModel(
          categoriesUseCase: gh<_i943.GetCategoriesUseCase>(),
          brandsUseCase: gh<_i717.GetBrandsUseCase>(),
          mostSellingProductsUseCase: gh<_i7.GetMostSellingProductsUseCase>(),
        ));
    return this;
  }
}
