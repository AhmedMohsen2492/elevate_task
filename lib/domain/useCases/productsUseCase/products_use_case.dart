import 'package:dartz/dartz.dart';
import 'package:elevate_task/data/models/ProductsResponse.dart';
import 'package:injectable/injectable.dart';
import '../../repos/productsRepo/products_repo.dart';

@injectable
class ProductsUseCase {
  ProductsRepo productsRepo;
  ProductsUseCase(this.productsRepo);

  Future<Either<String, ProductsResponse>> execute() {
    return productsRepo.getProducts();
  }
}