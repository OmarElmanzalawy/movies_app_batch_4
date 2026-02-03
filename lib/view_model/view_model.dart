import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final vm = ViewModel();

class ViewModel {

  ValueNotifier<List<MovieModel>> movies = ValueNotifier([]);

  ValueNotifier<bool> isDarkMode = ValueNotifier(true);

  //methods

  Future<void> toggleTheme()async{

     final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool("isDarkMode", !vm.isDarkMode.value);

            vm.isDarkMode.value = !vm.isDarkMode.value;
            
  }

}