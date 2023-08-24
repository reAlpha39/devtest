// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:devtest/core/core.dart' as _i6;
import 'package:devtest/core/infrastructures/helper/src/api_base_helper.dart'
    as _i3;
import 'package:devtest/core/infrastructures/helper/src/error_helper.dart'
    as _i4;
import 'package:devtest/features/features.dart' as _i7;
import 'package:devtest/features/home/data/data_source/src/home_data_source_impl.dart'
    as _i5;
import 'package:devtest/features/home/data/repositories/src/home_repo_impl.dart'
    as _i8;
import 'package:devtest/features/home/domain/usecases/src/create_user_usecase.dart'
    as _i9;
import 'package:devtest/features/home/domain/usecases/src/get_cities_usecase.dart'
    as _i10;
import 'package:devtest/features/home/domain/usecases/src/get_users_usecase.dart'
    as _i11;
import 'package:devtest/features/home/presentation/bloc/cities/cities_cubit.dart'
    as _i13;
import 'package:devtest/features/home/presentation/bloc/create_user/create_user_cubit.dart'
    as _i14;
import 'package:devtest/features/home/presentation/bloc/user/user_cubit.dart'
    as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ApiBaseHelper>(() => _i3.ApiBaseHelper());
    gh.factory<_i4.ErrorHelper>(() => _i4.ErrorHelper());
    gh.factory<_i5.HomeDataSource>(
        () => _i5.HomeDataSourceImpl(gh<_i6.ApiBaseHelper>()));
    gh.factory<_i7.HomeRepo>(() => _i8.HomeRepoImpl(gh<_i7.HomeDataSource>()));
    gh.factory<_i9.CreateUserUsecase>(
        () => _i9.CreateUserUsecase(gh<_i7.HomeRepo>()));
    gh.factory<_i10.GetCitiesUsecase>(
        () => _i10.GetCitiesUsecase(gh<_i7.HomeRepo>()));
    gh.factory<_i11.GetUsersUsecase>(
        () => _i11.GetUsersUsecase(gh<_i7.HomeRepo>()));
    gh.factory<_i12.UserCubit>(() => _i12.UserCubit(gh<_i7.GetUsersUsecase>()));
    gh.factory<_i13.CitiesCubit>(
        () => _i13.CitiesCubit(gh<_i7.GetCitiesUsecase>()));
    gh.factory<_i14.CreateUserCubit>(
        () => _i14.CreateUserCubit(gh<_i7.CreateUserUsecase>()));
    return this;
  }
}
