import 'package:flutter/material.dart';
import 'package:namer_app/app_state.dart';
import 'package:namer_app/layouts/narrow_screen.dart';
import 'package:namer_app/layouts/wide_screen.dart';
import 'package:namer_app/views/favorites_page_view.dart';
import 'package:namer_app/views/generator_page_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  final pages = [
    GeneratorPage(),
    FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 480) {
            return NarrowScreen(
              selectedIndex: selectedIndex,
              currentPage: pages[selectedIndex],
              onPageSelected: (value) => setState(() => selectedIndex = value),
            );
          } else {
            return WideScreen(
              selectedIndex: selectedIndex,
              currentPage: pages[selectedIndex],
              onPageSelected: (value) => setState(() => selectedIndex = value),
              isWide: constraints.maxWidth >= 600,
            );
          }
        },
      ),
    );
  }
}
