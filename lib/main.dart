import 'package:flutter/material.dart';
import 'package:flutter_complete_project/doc_app.dart';

import 'core/routing/app_router.dart';

void main() {
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
