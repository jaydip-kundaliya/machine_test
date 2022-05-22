import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:machine_test/app.dart';
import 'package:machine_test/services/local_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _serviceLocatorSetup();
  await GetIt.I.get<LocalPrefService>().initialPreferences();
  runApp(const MachineTestApp());
}

void _serviceLocatorSetup() {
  final getIt = GetIt.instance;

  final localPrefService = LocalPrefService();
  getIt.registerSingleton<LocalPrefService>(localPrefService);
}
