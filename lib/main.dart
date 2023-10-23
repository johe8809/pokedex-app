import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';

Future<void> main({List<Override>? overrides}) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(
        ProviderScope(
          overrides: <Override>[
            if (overrides != null) ...overrides,
          ],
          child: const App(),
        ),
      );
    },
    (Object error, StackTrace stack) {
      debugPrint(error.toString());
    },
  );
}
