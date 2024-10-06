import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_ecommerce_app/config/theme/my_theme.dart';
import 'package:route_ecommerce_app/core/reusable_components/product_widget.dart';
import 'package:route_ecommerce_app/presentation/home/tabs/home_tab/view_model/home_tab_viewModel.dart';

class MostSellingProductsListWidget extends StatefulWidget {
  const MostSellingProductsListWidget({super.key});

  @override
  State<MostSellingProductsListWidget> createState() => _MostSellingProductsListWidgetState();
}

class _MostSellingProductsListWidgetState extends State<MostSellingProductsListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeTabViewModel>().getMostSellingProducts();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabState>(
      buildWhen: (previous, current) {
        if(current is MostSellingProductsSuccessState || current is MostSellingProductsErrorState || current is MostSellingProductsLoadingState){
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if(state is MostSellingProductsSuccessState){
          return SizedBox(
            height: 280.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProductWidget(productEntity: state.products[index]),
            itemCount: state.products.length,
            ),
          );
        }
        if(state is BrandsLoadingState){
          return Center(child: CircularProgressIndicator(),);
        }
        if(state is MostSellingProductsErrorState){
          return Center(child: Text(state.errorMessage),);
        }
        return Container();
      } ,);
  }
}
