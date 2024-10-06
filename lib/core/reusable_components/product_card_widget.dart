// import 'package:flutter/material.dart';
// import 'package:flutter_product_card/flutter_product_card.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:route_ecommerce_app/domain/entities/product_entity/ProductEntity.dart';
//
// class ProductCardWidget extends StatelessWidget {
//   ProductEntity productEntity;
//    ProductCardWidget({super.key, required this.productEntity});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 300.w,
//       height: 400,
//       child: Column(
//         children: [
//           ProductCard(
//             imageUrl: productEntity.imageCover ?? '',
//             //add your image url here
//             categoryName: productEntity.category?.name?? '',
//             productName: productEntity.title ?? '',
//             price: productEntity.price!.toDouble(),
//
//             currency: 'EGP', // Default is '$'
//             onTap: () {
//               // Handle card tap event
//             },
//             onFavoritePressed: () {
//               // Handle favorite button press
//             },
//             shortDescription:
//             'comfortable & airy.', // Optional short description
//             rating: productEntity.ratingsAverage?.toDouble(), // Optional rating
//             discountPercentage:productEntity.priceAfterDiscount?.toDouble() , // Optional discount percentage
//             isAvailable: true, // Optional availability status
//             cardColor: Colors.white, // Optional card background color
//             textColor: Colors.black, // Optional text color
//             borderRadius: 8.0, // Optional border radius
//           ),
//         ],
//       ),
//     );
//   }
// }
