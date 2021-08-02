import 'package:get_it/get_it.dart';
import 'package:quotes_app/cubit/quote_state.dart';
import 'package:quotes_app/db/quote_repository.dart';


class AppInitializer {
  static late GetIt getIt;

  AppInitializer._();

  void resetLeadCreation() async {
    await getIt.unregister();
  }

  static void close() {
    getIt.reset();
  }

  static void create() {
    _initRepos();
    _initNotifiers();
    _initBlocs();
  }

  static dynamic initGetIt() {
    getIt = GetIt.I;
    create();
  }

  static dynamic logout() async {
    try {
      await getIt.reset();
      await initGetIt();
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {}
  }

  static void _initBlocs() {
    getIt.registerLazySingleton(() => QuoteCubit());
  }

  static void _initNotifiers() {}

  static void _initRepos() {
    getIt.registerLazySingleton(() => DataGenerator());
  }
}
