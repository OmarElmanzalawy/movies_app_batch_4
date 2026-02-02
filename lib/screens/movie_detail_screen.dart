import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/view_model/view_model.dart';
import 'package:movies_app/widgets/category_capsule.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.model});

  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: size.height,
        child: Stack(
          children: [
            Hero(
              tag: model.id,
              child: Image.network(
                "https://image.tmdb.org/t/p/w500/${model.backdropPath}",
                // height: 400,
                height: size.height * 0.4,
                width: double.infinity,
                fit: BoxFit.cover,
                ),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: BackButton(
                style: ButtonStyle(
                  backgroundColor: vm.isDarkMode.value ? WidgetStatePropertyAll(Colors.grey.shade900) : WidgetStatePropertyAll(Colors.grey.shade300),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)))
                ),
                onPressed:() => Navigator.pop(context),
              ),
              ),
            Positioned(
              bottom: 0,
              height: size.height * 0.61,
              width: size.width,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: vm.isDarkMode.value ? Colors.grey.shade900 : Colors.grey.shade100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber,),
                          const SizedBox(width: 4,),
                          Text("${model.voteAverage.toStringAsFixed(1)}/10"),
                          Spacer(),
                          Text(model.releaseDate)
                        ],
                      ),
                    const SizedBox(height: 20,),
                    Wrap(
                      spacing: 12,
                      children: [
                        CategoryCapsule(),
                        CategoryCapsule()
                      ],
                    ),
                    const SizedBox(height: 12,),
                    Text(
                      // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      model.description,
                      style: TextStyle(fontWeight: FontWeight.w500),
                      )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}