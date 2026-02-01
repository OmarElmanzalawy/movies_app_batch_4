import 'package:flutter/material.dart';
import 'package:movies_app/widgets/category_capsule.dart';
import 'package:movies_app/widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
        centerTitle: false,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline)),
          IconButton(onPressed: (){}, icon: Icon(Icons.bedtime)),
        ],
        ),
      body: ListView(
        padding: EdgeInsets.only(top: 30,right: 12,left: 12),
        children: [
         MovieCard(),
         MovieCard()
        ],
      )
    );
  }
}