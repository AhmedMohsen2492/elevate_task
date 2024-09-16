import 'package:elevate_task/ui/screens/products/products_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: ProductsScreen.routeName,
      routes: {
       ProductsScreen.routeName : (_)=> ProductsScreen(),
      },
    );
  }
}
