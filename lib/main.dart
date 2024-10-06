import 'package:flutter/material.dart';
import 'package:route_ecommerce_app/core/DI/di.dart';
import 'package:route_ecommerce_app/core/api/api_manager/api_manager.dart';
import 'package:route_ecommerce_app/my_app.dart';

void main() {
  configureDependencies();
  ApiManger.init();
  runApp(const MyApp());
}


