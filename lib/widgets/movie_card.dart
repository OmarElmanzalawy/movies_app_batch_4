import 'package:flutter/material.dart';
import 'package:movies_app/widgets/category_capsule.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  child: Image.asset(
                    "assets/poster.jpeg",
                    width: 80,
                    height: 120,
                    fit: BoxFit.cover,
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
                        Text("Oppenheimer",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Icon(Icons.star,color: Colors.amber,),
                            Text("7.0/10")
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
                            Text("2024-08,-18"),
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
          );
  }
}