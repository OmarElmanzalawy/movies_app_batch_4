import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final vm = ViewModel();

class ViewModel {

  ValueNotifier<List<MovieModel>> movies = ValueNotifier([]);

  ValueNotifier<List<MovieModel>> favoriteMovies = ValueNotifier([]);

  ValueNotifier<bool> isDarkMode = ValueNotifier(true);

  int currentPage = 1;

  //methods

  Future<void> toggleTheme()async{

     final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool("isDarkMode", !vm.isDarkMode.value);

            vm.isDarkMode.value = !vm.isDarkMode.value;
  }

  void addToFavorite(MovieModel model){
    //Modify list in place
    // doesn't return new list object
    // favoriteMovies.value.add(model);

    favoriteMovies.value = [...favoriteMovies.value, model];
  }

  void removeFromFavorite(MovieModel model){
    // favoriteMovies.value.remove(model);

    favoriteMovies.value = favoriteMovies.value.where((movie) => movie.id != model.id ).toList();
  }

}