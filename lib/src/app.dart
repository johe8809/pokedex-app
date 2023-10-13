import 'package:flutter/material.dart';

import 'ui/views/views.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) => const MaterialApp(
        title: 'Pokédex',
        home: HomeView(),
      );
}
