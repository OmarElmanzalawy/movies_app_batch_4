import 'package:flutter/material.dart';

class CategoryCapsule extends StatelessWidget {
  const CategoryCapsule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade600.withOpacity(0.6),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text("Action"),
    );
  }
}
