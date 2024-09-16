import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:elevate_task/data/models/ProductsResponse.dart';
import 'package:elevate_task/domain/repos/productsRepo/products_repo.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl extends ProductsRepo {
  @override
  Future<Either<String, ProductsResponse>> getProducts() async {
    String baseUrl = "fakestoreapi.com";
    String endPoint = "products";
    Uri uri = Uri.https(baseUrl, endPoint);
    Response response = await get(uri);
    List<dynamic> jsonData = jsonDecode(response.body);
    List<Product> products =
        jsonData.map((json) => Product.fromJson(json)).toList();

    ProductsResponse productsResponse = ProductsResponse(products);

    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        productsResponse.products?.isNotEmpty == true) {
      return Right(productsResponse);
    } else {
      return const Left("Something went wrong please try again later");
    }
  }
}
