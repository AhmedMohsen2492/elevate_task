// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repos/productsRepo/products_repo_impl.dart' as _i597;
import '../../ui/screens/products/products_view_model.dart' as _i1070;
import '../repos/productsRepo/products_repo.dart' as _i598;
import '../useCases/productsUseCase/products_use_case.dart' as _i160;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i598.ProductsRepo>(() => _i597.ProductsRepoImpl());
    gh.factory<_i160.ProductsUseCase>(
        () => _i160.ProductsUseCase(gh<_i598.ProductsRepo>()));
    gh.factory<_i1070.ProductsViewModel>(
        () => _i1070.ProductsViewModel(gh<_i160.ProductsUseCase>()));
    return this;
  }
}
