import 'package:flutter/material.dart';
import 'package:latihan_praktek_m09/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.purple, foregroundColor: Colors.white),
          tabBarTheme: const TabBarTheme(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              indicatorColor: Colors.white),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.purple,
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18)),
          listTileTheme: const ListTileThemeData()),
      home: const Home(),
    );
  }
}
