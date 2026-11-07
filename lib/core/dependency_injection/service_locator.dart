import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:social_hub/core/network/dio_client.dart';
import 'package:social_hub/core/storage/session_storage.dart';
import 'package:social_hub/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:social_hub/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:social_hub/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:social_hub/features/auth/domain/repositories/auth_repository.dart';
import 'package:social_hub/features/auth/domain/use_cases/login_use_case.dart';
import 'package:social_hub/features/auth/presentation/logic/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  await Hive.initFlutter();

  final sessionBox = await Hive.openBox<dynamic>('session');

  getIt.registerLazySingleton<Box<dynamic>>(
    () => sessionBox,
  );

  getIt.registerLazySingleton<SessionStorage>(
    () => SessionStorageImpl(getIt()),
  );

  getIt.registerLazySingleton<DioClient>(
    () => DioClient(),
  );

  getIt.registerLazySingleton<Dio>(
    () => getIt<DioClient>().dio,
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt()),
  );

  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(getIt()),
  );
}