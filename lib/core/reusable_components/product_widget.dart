import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_ecommerce_app/config/theme/my_theme.dart';
import 'package:route_ecommerce_app/core/utils/assets_manager/assets_manager.dart';
import 'package:route_ecommerce_app/core/utils/strings_manager/strings_manager.dart';
import 'package:route_ecommerce_app/domain/entities/product_entity/ProductEntity.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget({super.key, required this.productEntity});

  ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        //width: 237.h,
        height: 237.h,
        width: 191.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(
                width: 2.w,
                color: Theme.of(context).primaryColor.withOpacity(0.3))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(18.r),
                  child: CachedNetworkImage(
                    width: 191.w,
                    height: 128.h,

                    imageUrl: productEntity.imageCover ?? '',
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
                SvgPicture.asset(AssetsManger.wishListIcon),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                productEntity.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            productEntity.priceAfterDiscount != null
                ? Padding(
                    padding: REdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          'EGP ${productEntity.priceAfterDiscount}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          '${productEntity.price} EGP',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.6),
                                    decoration: TextDecoration.lineThrough,
                                  ),
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: REdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'EGP ${productEntity.price}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(StringsManager.review,
                      style: Theme.of(context).textTheme.labelSmall),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text('(${productEntity.ratingsAverage})',
                      style: Theme.of(context).textTheme.labelSmall),
                  SizedBox(
                    width: 4.w,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 15,
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    AssetsManger.plusIcon,
                    width: 30.w,
                    height: 30.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
