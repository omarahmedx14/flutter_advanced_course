import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/di/dependency_injection.dart';
import 'package:flutter_complete_project/doc_app.dart';

import 'core/routing/app_router.dart';

void main() {
  setupGetIt();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
