import 'package:dartz/dartz.dart';
import 'package:elevate_task/data/models/ProductsResponse.dart';

abstract class ProductsRepo {
  Future<Either<String, ProductsResponse>> getProducts();
}