import 'dart:async' show Future;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

import 'app.dart';
import 'base_injection.dart' as injection;

BuildContext? appContext;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

//007eJxTYDidGCh7cAZbxY5Za3zDYl7fvcSs/fTxxZUMS2T2aPx/0ztfgSHFLM3AONEw1dIiLc3EJC3ZwtI82cLUzCgpxdjQwsg8Te+cfXpDICND35s8FkYGCATx2RiKUxKBkIEBAA5YIeo=

  // Set logging level and configure logging output
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    // Uncomment for detailed logging
    // print('${record.level.name}: ${record.time}: ${record.message}');
  });

  // Ensure services are initialized properly
  await Future.delayed(const Duration(milliseconds: 300));

  // Initialize dependencies
  await injection.init();

  runApp(const ProviderScope(child: MyApp()));
}

final supportedLocales = <Locale>[
  const Locale('ar'),
  const Locale('en'),
  const Locale('sv'),
];
