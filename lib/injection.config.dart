// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import 'data/auth/datasources/auth_local_datasource.dart' as _i8;
import 'data/auth/datasources/auth_remote_datasource.dart' as _i3;
import 'data/auth/repositories/auth_repository_impl.dart' as _i10;
import 'data/core/utils/network/network_info.dart' as _i6;
import 'domain/auth/repositories/auth_repository.dart' as _i9;
import 'domain/auth/usecases/get_signed_in_user_use_case.dart' as _i11;
import 'domain/auth/usecases/login_use_case.dart' as _i12;
import 'domain/core/utils/network/network_info.dart' as _i5;
import 'injectable_module.dart' as _i15;
import 'presentation/auth/blocs/auth/auth_bloc.dart' as _i13;
import 'presentation/auth/blocs/login/login_bloc.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.AuthRemoteDatasource>(
      () => _i3.AuthRemoteDatasourceImpl());
  gh.lazySingleton<_i4.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  gh.lazySingleton<_i5.NetworkInfo>(
      () => _i6.NetworkInfoImpl(get<_i4.InternetConnectionChecker>()));
  await gh.lazySingletonAsync<_i7.SharedPreferences>(
      () => injectableModule.sharedPref,
      preResolve: true);
  gh.lazySingleton<_i8.AuthLocalDatasource>(
      () => _i8.AuthLocalDatasourceImpl(get<_i7.SharedPreferences>()));
  gh.lazySingleton<_i9.AuthRepository>(() => _i10.AuthRepositoryImpl(
      get<_i3.AuthRemoteDatasource>(),
      get<_i8.AuthLocalDatasource>(),
      get<_i5.NetworkInfo>()));
  gh.lazySingleton<_i11.GetSignedInUserUseCase>(
      () => _i11.GetSignedInUserUseCase(get<_i9.AuthRepository>()));
  gh.lazySingleton<_i12.LoginUseCase>(
      () => _i12.LoginUseCase(get<_i9.AuthRepository>()));
  gh.factory<_i13.AuthBloc>(
      () => _i13.AuthBloc(get<_i11.GetSignedInUserUseCase>()));
  gh.factory<_i14.LoginBloc>(() => _i14.LoginBloc(get<_i12.LoginUseCase>()));
  return get;
}

class _$InjectableModule extends _i15.InjectableModule {}
