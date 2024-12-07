import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:workerbase_scanner/core/localizations/localizations.dart';
import 'package:workerbase_scanner/core/providers/initializer.dart';
import 'package:workerbase_scanner/core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final GetIt getIt = await initializeInjections();
  await getIt.allReady();
  await EasyLocalization.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const <Locale>[Locale('en')],
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      child: const _App(),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        builder: (_, Widget? child) => child!,
        title: 'Workerbase Scanner App',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: const Locale('en'),
      ),
    );
  }
}
