import 'package:dartz/dartz.dart';
import 'package:elevate_task/data/models/ProductsResponse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/useCases/productsUseCase/products_use_case.dart';
import '../../utils/base_states.dart';

@injectable
class ProductsViewModel extends Cubit{
  ProductsUseCase productsUseCase;
  ProductsViewModel(this.productsUseCase) : super(BaseInitialState);

  void getProducts() async {
    emit(BaseLoadingState());
    Either<String, ProductsResponse> response = await productsUseCase.execute();
    response.fold((error) {
      emit(BaseErrorState(error));
    }, (success) {
      emit(BaseSuccessState(success));
    });
  }

}
