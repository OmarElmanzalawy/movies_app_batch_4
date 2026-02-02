import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/screens/movie_detail_screen.dart';
import 'package:movies_app/widgets/category_capsule.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.model});

  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder:(context) => MovieDetailScreen(
            model: model,
          ),)
          );
      },
      child: Container(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    child: Hero(
                      tag: model.id,
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w500/${model.posterPath}",
                        width: 80,
                        height: 120,
                        fit: BoxFit.cover,
                        ),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Expanded(
                    child: Container(
                      // color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          Text(model.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.amber,),
                              Text("${model.voteAverage.toStringAsFixed(1)}/10")
                            ],
                          ),
                          const SizedBox(height: 3,),
                          Wrap(
                            spacing: 5,
                            runSpacing: 10,
                            children: [
                              CategoryCapsule(),
                              CategoryCapsule(),
                              CategoryCapsule(),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.schedule_outlined,color: Colors.teal,),
                              Text(model.releaseDate),
                              Spacer(),
                              IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}