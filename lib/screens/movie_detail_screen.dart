import 'package:flutter/material.dart';
import 'package:movies_app/widgets/category_capsule.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: size.height,
        child: Stack(
          children: [
            Image.asset(
              "assets/backdrop.jpeg",
              // height: 400,
              height: size.height * 0.4,
              width: double.infinity,
              fit: BoxFit.cover,
              ),
            Positioned(
              top: 30,
              left: 20,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios)
                  ),
              )
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
                    topRight: Radius.circular(30)
                  ),
                  color: Colors.grey.shade900,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Oppenheimer",
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
                          Text("7.0/10"),
                          Spacer(),
                          Text("2026-05-12")
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
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
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