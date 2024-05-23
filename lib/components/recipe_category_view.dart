import 'package:flutter/material.dart';
import 'package:foodrecipe/Screens/all_recipe.dart';

class RecipeCategoryView extends StatelessWidget {
  final String name;
  final String image;
  const RecipeCategoryView(
      {super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AllRecipe(recipe: name)));
      },
      child: SizedBox(
        height: h * 0.105,
        width: w * .2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: h * 0.08,
              width: w * .15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
              ),
            ),
            Center(
              child: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
