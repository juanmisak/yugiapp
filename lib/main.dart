import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yugiapp/providers/card_detail_provider.dart';
import 'providers/card_provider.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CardDetailProvider()),
        ChangeNotifierProvider(create: (_) => CardProvider()),
      ],
      child: MaterialApp(
        title: 'Yu-Gi-Oh! App',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: const HomeView(),
      ),
    );
  }
}
