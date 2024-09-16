import 'package:elevate_task/ui/screens/products/product_widget.dart';
import 'package:elevate_task/ui/screens/products/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/di/di.dart';
import '../../utils/app_colors.dart';
import '../../utils/base_states.dart';

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
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder(
          bloc: viewModel,
            builder: (context, state) {
              if (state is BaseLoadingState) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                );
              } else  if (state is BaseSuccessState) {
                return GridView.builder(
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.8),
                  itemCount: state.productsResponse.products!.length,
                  itemBuilder: (context, index) =>
                      ProductWidget(state.productsResponse.products!, index),
                );
              } else {
                return const Expanded(
                  child: Center(
                      child: Text(
                        "No data found !!",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      )),
                );
              }
            },
        ),
      ),
    );
  }
}
