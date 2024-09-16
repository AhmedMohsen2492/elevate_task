import 'package:elevate_task/data/repos/productsRepo/products_repo_impl.dart';
import 'package:elevate_task/domain/repos/productsRepo/products_repo.dart';
import 'package:elevate_task/ui/screens/products/products_screen.dart';
import 'package:flutter/material.dart';
import 'domain/di/di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsRepo productsRepo = ProductsRepoImpl();
    productsRepo.getProducts();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ProductsScreen.routeName,
      routes: {
        ProductsScreen.routeName: (_) => const ProductsScreen(),
      },
    );
  }
}
