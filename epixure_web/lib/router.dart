import 'package:epixure_web/testingEngine/pages/admin_panel.dart';
import 'package:epixure_web/testingEngine/pages/module_admin.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static final FluroRouter router = FluroRouter();

  static void setupRouter() {
    router.define(
      '/setting',
      handler: Handler(
        handlerFunc: (context, parameters) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(context!, MaterialPageRoute(builder: (_) => const AdminPanel()));
          });
        },
      ),
    );
    router.define(
      '/adminTest',
      handler: Handler(
        handlerFunc: (context, parameters) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(context!, MaterialPageRoute(builder: (_) => const ModuleAdmin()));
          });
        },
      ),
    );

    // Другие маршруты...
  }
}