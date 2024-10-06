import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_ecommerce_app/domain/entities/CategoryEntity.dart';

class CategoryItemWidget extends StatelessWidget {
  CategoryEntity category;
   CategoryItemWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: category.image ?? '',
          imageBuilder: (context, imageProvider) => CircleAvatar(
            backgroundImage: imageProvider,
            radius: 50.r,

          ),

          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Text(category.name ?? '', style: Theme.of(context).textTheme.titleSmall,)
      ],
    );
  }
}
