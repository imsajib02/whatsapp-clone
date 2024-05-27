import 'package:get_it/get_it.dart';

import '../barrel/utils.dart';

final getIt = GetIt.instance;

void registerServices() {
  getIt.registerLazySingleton<MyPref>(() => MyPref());
}