
import '../../../Core/Services/auth_service.dart';
import '../../../Core/Services/network_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Features/Authentication/Presentation/Auth Bloc/auth_bloc.dart';

class DependencyInjectionHelper {
  final sl = GetIt.instance; // sl = service locator

  /// Registering all components to be able to use them later in the app
  /// Note: don't forget to call this in main.dart
  Future<void> init() async {
    await _registerCoreDependencies();
    await _registerDataSources();
    await _registerRepositories();
    await _registerUseCases();
   // await _registerBloc();
  }

  /// Registers all core components like services
  Future<void> _registerCoreDependencies() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton<AuthService>(
      () => AuthService(sl()),
    );
    sl.registerLazySingleton<NetworkService>(
      () {
        final Dio public = Dio();
        final Dio private = Dio();
        return NetworkService(
          publicDio: public,
          privateDio: private,
        );
      },
    );
  }

  /// Registers any [DATA SOURCE]
  Future<void> _registerDataSources() async {}

  /// Registers any [REPOSITORY]
  Future<void> _registerRepositories() async {}

  /// Registers any [USE CASE]
  Future<void> _registerUseCases() async {}

  /// Registers any [Bloc]
  // Future<void> _registerBloc() async {
  //   sl.registerLazySingleton(
  //     () => AuthBloc(),
  //   );
  //   sl.registerLazySingleton(() => StoryCubit());
  // }
}
