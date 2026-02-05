import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/screens/home_screen.dart';
import 'package:movies_app/screens/movie_detail_screen.dart';
import 'package:movies_app/view_model/view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  final prefs = await SharedPreferences.getInstance();

  final bool? localDarkMode = prefs.getBool('isDarkMode');

  print("fetched from local storage: $localDarkMode");

  vm.isDarkMode.value = localDarkMode ?? true;
  
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
      );
      } 
    );
  }
}
