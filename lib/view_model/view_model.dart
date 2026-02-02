import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';

final vm = ViewModel();

class ViewModel {

  ValueNotifier<List<MovieModel>> movies = ValueNotifier([]);

  ValueNotifier<bool> isDarkMode = ValueNotifier(true);

}