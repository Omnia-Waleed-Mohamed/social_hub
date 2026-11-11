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
import 'package:social_hub/features/home/data/data_sources/posts_local_data_source.dart';
import 'package:social_hub/features/home/data/data_sources/posts_remote_data_source.dart';
import 'package:social_hub/features/home/data/repositories/posts_repository_impl.dart';
import 'package:social_hub/features/home/domain/repositories/posts_repository.dart';
import 'package:social_hub/features/home/domain/use_cases/get_posts_use_case.dart';
import 'package:social_hub/features/home/presentation/logic/home_cubit.dart';
import 'package:social_hub/features/users/data/data_source/users_local_data_source.dart';
import 'package:social_hub/features/users/data/data_source/users_remote_data_source.dart';
import 'package:social_hub/features/users/data/repository/users_repository_impl.dart';
import 'package:social_hub/features/users/domain/repository/users_repository.dart';
import 'package:social_hub/features/users/domain/use_cases/get_users_use_case.dart';
import 'package:social_hub/features/users/presentation/logic/users_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  await Hive.initFlutter();

  final sessionBox = await Hive.openBox<dynamic>('session');

  getIt.registerLazySingleton<Box<dynamic>>(() => sessionBox);

  getIt.registerLazySingleton<SessionStorage>(
    () => SessionStorageImpl(getIt()),
  );

  getIt.registerLazySingleton<DioClient>(() => DioClient());

  getIt.registerLazySingleton<Dio>(() => getIt<DioClient>().dio);

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () =>
        AuthRepositoryImpl(remoteDataSource: getIt(), localDataSource: getIt()),
  );

  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // Open posts cache box.
  final postsCacheBox = await Hive.openBox<dynamic>('posts_cache');

  getIt.registerSingleton<Box<dynamic>>(
    postsCacheBox,
    instanceName: 'postsCacheBox',
  );

  // Data Sources
  getIt.registerLazySingleton<PostsRemoteDataSource>(
    () => PostsRemoteDataSourceImpl(getIt<DioClient>().dio),
  );

  getIt.registerLazySingleton<PostsLocalDataSource>(
    () => PostsLocalDataSourceImpl(
      getIt<Box<dynamic>>(instanceName: 'postsCacheBox'),
    ),
  );

  // Repository
  getIt.registerLazySingleton<PostsRepository>(
    () => PostsRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );

  // Use Case
  getIt.registerLazySingleton<GetPostsUseCase>(() => GetPostsUseCase(getIt()));

  // Cubit
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getPostsUseCase: getIt()));


  getIt.registerLazySingleton<UsersLocalDataSource>(
  () => UsersLocalDataSource(
    Hive.box<dynamic>('users_cache'),
  ),
);



getIt.registerLazySingleton<UsersRemoteDataSource>(
  () => UsersRemoteDataSource(
    getIt<DioClient>(),
  ),
);

getIt.registerLazySingleton<UsersRepository>(
  () => UsersRepositoryImpl(
    remoteDataSource: getIt<UsersRemoteDataSource>(),
    localDataSource: getIt<UsersLocalDataSource>(),
  ),
);

getIt.registerLazySingleton<GetUsersUseCase>(
  () => GetUsersUseCase(
    getIt<UsersRepository>(),
  ),
);

getIt.registerFactory<UsersCubit>(
  () => UsersCubit(
    getIt<GetUsersUseCase>(),
  ),
);
}
