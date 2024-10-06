import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_ecommerce_app/core/DI/di.dart';
import 'package:route_ecommerce_app/core/api/api_manager/api_manager.dart';
import 'package:route_ecommerce_app/core/utils/assets_manager/assets_manager.dart';
import 'package:route_ecommerce_app/core/utils/strings_manager/strings_manager.dart';
import 'package:route_ecommerce_app/data/data_source_impl/categories_datasource_impl.dart';
import 'package:route_ecommerce_app/data/repository_impl/categories_repository_impl.dart';
import 'package:route_ecommerce_app/domain/usecases/get_categories_usecase.dart';
import 'package:route_ecommerce_app/my_app.dart';
import 'package:route_ecommerce_app/presentation/home/tabs/home_tab/view_model/home_tab_viewModel.dart';
import 'package:route_ecommerce_app/presentation/home/tabs/home_tab/widgets/brands_list_widget.dart';
import 'package:route_ecommerce_app/presentation/home/tabs/home_tab/widgets/catories_list_widget.dart';
import 'package:route_ecommerce_app/presentation/home/tabs/home_tab/widgets/products_list_widget.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  List<String> ads = [
    AssetsManger.ad1,
    AssetsManger.ad2,
    AssetsManger.ad3,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeTabViewModel>(),
      child: Padding(
        padding:  REdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 200.h,
                    aspectRatio: 16 / 9,
                    viewportFraction: .8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {},
                    scrollDirection: Axis.horizontal,
                  ),
                  itemCount: ads.length,
                  itemBuilder: (
                      BuildContext context,
                      int itemIndex,
                      int pageViewIndex,
                      ) {
                    return Image.asset(ads[itemIndex]);
                  }),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(StringsManager.categories, style: Theme.of(context).textTheme.titleMedium,),
                  Text(StringsManager.viewAll, style: Theme.of(context).textTheme.titleSmall,),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h,)),

            SliverToBoxAdapter(child: CategoriesListWidget()),
            SliverToBoxAdapter(child: SizedBox(height: 16.h,)),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(StringsManager.brands, style: Theme.of(context).textTheme.titleMedium,),
                  Text(StringsManager.viewAll, style: Theme.of(context).textTheme.titleSmall,),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h,)),
            SliverToBoxAdapter(child: BrandsListWidget(),),
            SliverToBoxAdapter(child: SizedBox(height: 16.h,)),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(StringsManager.mostSellingProducts, style: Theme.of(context).textTheme.titleMedium,),
                  Text(StringsManager.viewAll, style: Theme.of(context).textTheme.titleSmall,),
                ],
              ),
            ),
            SliverToBoxAdapter(child: MostSellingProductsListWidget()),
          ],
        )
      ),
    );
  }
}

