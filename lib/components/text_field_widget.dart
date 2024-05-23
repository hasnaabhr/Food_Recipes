import 'package:flutter/material.dart';
import 'package:foodrecipe/Screens/all_recipe.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
        height: h * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 1),
              blurRadius: 2,
            ),
          ],
        ),
        child: TextField(
          controller: search,
          style: TextStyle(
            fontSize: w * .04,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "what's cookin in your mind...?",
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: w * .03,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AllRecipe(recipe: search.text)));
              },
              
              child: Icon(
                Icons.search,
                color: Colors.red,
                size: w * .07,
              ),
            ),
          ),
        ));
  }
}
