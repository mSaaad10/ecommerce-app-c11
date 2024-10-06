import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_ecommerce_app/config/theme/my_theme.dart';
import 'package:route_ecommerce_app/domain/entities/BrandEntity.dart';

class BrandWidget extends StatelessWidget {
  BrandWidget({super.key, required this.brandEntity});

  BrandEntity brandEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          width: 80.w,
          height: 80.h,
          imageUrl: brandEntity.image ?? '',
          // imageBuilder: (context, imageProvider) => CircleAvatar(
          //
          //   backgroundImage: imageProvider,
          //   radius: 60.r,
          // ),
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Center(
            child: Icon(Icons.error),
          ),
        ),
        Text(brandEntity.name ?? '',style:  Theme.of(context).textTheme.titleMedium,),
      ],
    );
  }
}
