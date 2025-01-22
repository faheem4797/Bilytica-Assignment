part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator.registerLazySingleton(() => Dio());

  serviceLocator.registerLazySingleton(() => InternetConnection());

  serviceLocator.registerLazySingleton<ConnectionChecker>(
      () => ConnectionCheckerImpl(serviceLocator()));

  serviceLocator
    ..registerLazySingleton<UserRemoteDatasource>(
        () => UserRemoteDatasourceImpl(dio: serviceLocator()))
    ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
          connectionChecker: serviceLocator(),
          userRemoteDatasource: serviceLocator(),
        ))
    ..registerLazySingleton(() => GetUsers(userRepository: serviceLocator()))
    ..registerLazySingleton(() => GetUsersBloc(getUsers: serviceLocator()));
}
