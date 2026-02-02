import 'package:flutter/material.dart';
import 'package:movies_app/services/api_service.dart';
import 'package:movies_app/view_model/view_model.dart';
import 'package:movies_app/widgets/category_capsule.dart';
import 'package:movies_app/widgets/movie_card.dart';


//Convert variable to notifier
//Wrap ui with valueListenableBuilder

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    ApiService.sendRequest();
    super.initState();
  }

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
      body: 
        ValueListenableBuilder(
          valueListenable: vm.movies,
          builder:(context, value, child) {
            return vm.movies.value.isEmpty ? Center(
              child: CircularProgressIndicator(),
            )

            :
             ListView.builder(
          padding: EdgeInsets.only(top: 30,right: 12,left: 12),
          itemCount: vm.movies.value.length,
          itemBuilder: (context, index) {
            return MovieCard(
              model: vm.movies.value[index],
            );
          },
        );
          } 
        )
    );
  }
}

//eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNjVhMjZlY2M0MGFlNDc5OWE0NmE5ZDNiYWYwMWE1NCIsIm5iZiI6MTc2OTk0ODU1Ni4zMjgsInN1YiI6IjY5N2Y0NThjMjBjOWExZDU5MTcwZTkwYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FHO94nSCxrev5SGSM9_w4DcCJ4WpEx4urSHWMszHRt8