// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:movie_finder/app/injection_container.dart' as _i13;
import 'package:movie_finder/auth/cubit/auth_cubit.dart' as _i9;
import 'package:movie_finder/data/account_data_source.dart' as _i7;
import 'package:movie_finder/data/movie_data_source.dart' as _i4;
import 'package:movie_finder/features/details/cubit/details_cubit.dart' as _i10;
import 'package:movie_finder/features/home/cubit/home_cubit.dart' as _i12;
import 'package:movie_finder/features/home/pages/favorite/cubit/favorite_cubit.dart'
    as _i11;
import 'package:movie_finder/repositories/account_repositories.dart' as _i8;
import 'package:movie_finder/repositories/movie_repositories.dart' as _i5;
import 'package:movie_finder/widgets/search_widget/cubit/search_cubit.dart'
    as _i6;

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
    final registerModule = _$RegisterModule();
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<String>(
      () => registerModule.apiKey,
      instanceName: 'ApiKey',
    );
    gh.lazySingleton<_i3.Dio>(() => registerModule.dio(
          gh<String>(instanceName: 'BaseUrl'),
          gh<String>(instanceName: 'ApiKey'),
        ));
    gh.factory<_i4.MovieRemoteRetrofitDataSource>(
        () => _i4.MovieRemoteRetrofitDataSource(gh<_i3.Dio>()));
    gh.factory<_i5.MovieRepository>(
        () => _i5.MovieRepository(gh<_i4.MovieRemoteRetrofitDataSource>()));
    gh.factory<_i6.SearchCubit>(
        () => _i6.SearchCubit(gh<_i5.MovieRepository>()));
    gh.factory<_i7.AccountRemoteRetrofitDataSource>(
        () => _i7.AccountRemoteRetrofitDataSource(gh<_i3.Dio>()));
    gh.factory<_i8.AccountRepository>(
        () => _i8.AccountRepository(gh<_i7.AccountRemoteRetrofitDataSource>()));
    gh.factory<_i9.AuthCubit>(() => _i9.AuthCubit(gh<_i8.AccountRepository>()));
    gh.factory<_i10.DetailsCubit>(
        () => _i10.DetailsCubit(gh<_i5.MovieRepository>()));
    gh.factory<_i11.FavoriteCubit>(
        () => _i11.FavoriteCubit(gh<_i8.AccountRepository>()));
    gh.factory<_i12.HomeCubit>(() => _i12.HomeCubit(gh<_i5.MovieRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i13.RegisterModule {}
