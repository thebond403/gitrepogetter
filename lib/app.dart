import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gitstaredrepogetter/core/environment/envirionment_config.dart';
import 'package:gitstaredrepogetter/core/routes/app_router.dart';
import 'package:gitstaredrepogetter/objectbox.g.dart';

late final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey;
late final Store obStore;
Admin? admin;
void setupApp(EnvironmentType type) async {
  WidgetsFlutterBinding.ensureInitialized();
  rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  EnvironmentConfig.setupEnvironment(type);
  obStore = await openStore();
  if (Admin.isAvailable()) {
    admin = Admin(obStore);
  }
  runApp(
    ProviderScope(
        child: MaterialApp(
      title: "Git-Getter",
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.homePage,
      routes: AppRouter.routes,
    )),
  );
}
