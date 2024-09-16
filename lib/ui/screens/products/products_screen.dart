import 'package:elevate_task/ui/screens/products/products_view_model.dart';
import 'package:flutter/material.dart';
import '../../../domain/di/di.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});
  static const String routeName = "ProductsScreen";

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsViewModel viewModel = getIt();

  @override
  void initState() {
    super.initState();
    viewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
