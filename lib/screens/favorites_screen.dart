import 'package:flutter/material.dart';
import 'package:movies_app/view_model/view_model.dart';
import 'package:movies_app/widgets/movie_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Movies"),
      ),
      body: vm.favoriteMovies.isEmpty ? 
      
        Center(
          child: Text("No favorite movies added yet"),
        )
       : ListView.builder(
        itemCount: vm.favoriteMovies.length,
        itemBuilder: (context, index){
          return MovieCard(
            model: vm.favoriteMovies[index]
            );
        }
        ),
    );
  }
}