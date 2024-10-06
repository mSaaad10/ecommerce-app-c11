import 'package:route_ecommerce_app/domain/entities/BrandEntity.dart';
import 'package:route_ecommerce_app/domain/entities/CategoryEntity.dart';

import 'SubcategoryEntity.dart';


/// sold : 43992
/// images : ["https://ecommerce.routemisr.com/Route-Academy-products/1680395220690-1.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680395220693-3.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680395220692-2.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680395220713-4.jpeg"]
/// subcategory : [{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}]
/// ratingsQuantity : 19
/// _id : "6428cbd5dc1175abc65ca037"
/// title : "Essentials Embroidered Linear Logo T-Shirt Navy"
/// slug : "essentials-embroidered-linear-logo-t-shirt-navy"
/// description : "Comfortable and soft cotton blend fabric\nRibbed crew neck and short sleeves\nadidas signature branding print\nWash according to care label instructions"
/// quantity : 118
/// price : 749
/// priceAfterDiscount : 504
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680395220407-cover.jpeg"
/// category : {"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"}
/// brand : {"_id":"64089c3924b25627a2531593","name":"Adidas","slug":"adidas","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285881943.png"}
/// ratingsAverage : 3.8
/// id : "6428cbd5dc1175abc65ca037"

class ProductEntity {
  ProductEntity({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.priceAfterDiscount, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
    });


  num? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  num? priceAfterDiscount;
  String? imageCover;
  CategoryEntity? category;
  BrandEntity? brand;
  num? ratingsAverage;




}