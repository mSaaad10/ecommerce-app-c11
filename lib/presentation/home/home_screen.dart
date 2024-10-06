import 'package:flutter/material.dart';
import 'package:route_ecommerce_app/presentation/home/tabs/home_tab/view/home_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeTab(),
    );
  }
}
