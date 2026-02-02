import 'package:flutter/material.dart';
import 'package:movies_app/screens/home_screen.dart';
import 'package:movies_app/screens/movie_detail_screen.dart';
import 'package:movies_app/view_model/view_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: vm.isDarkMode,
      builder:(context, value, child) {
        return MaterialApp(
        theme: vm.isDarkMode.value ? ThemeData.dark() : ThemeData.light(),
        home: HomeScreen()
        // home: MovieDetailScreen(),
      );
      } 
    );
  }
}
