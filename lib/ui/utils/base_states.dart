import 'package:elevate_task/data/models/ProductsResponse.dart';

class BaseInitialState {}

class BaseLoadingState {}

class BaseSuccessState {
  ProductsResponse productsResponse ;
  BaseSuccessState(this.productsResponse);
}

class BaseErrorState {
  String errorMessage;

  BaseErrorState(this.errorMessage);
}