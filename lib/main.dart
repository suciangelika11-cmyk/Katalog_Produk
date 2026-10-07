import 'package:flutter/material.dart';
import 'pages/main_navigation_page.dart';

void main() {
  runApp(const KatalogApp());
}

class KatalogApp extends StatelessWidget {
  const KatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog Produk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const MainNavigationPage(),
    );
  }
}