import 'package:flutter/material.dart';
import 'package:foodrecipe/Screens/all_recipe.dart';
import 'package:foodrecipe/components/custom_appbar.dart';
import 'package:foodrecipe/components/search_tags.dart';
import 'package:foodrecipe/components/text_field_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key,});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(title: 'search', back: false),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: h * .016,
          horizontal: w * .032,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextFieldWidget(),
            SizedBox(
              height: h * .04,
            ),
            Text(
              'Search Tags',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: w * .06,
              ),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                spacing: 8,
                children: tags.map((label) {
                  return ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AllRecipe(recipe: label)));
                      },
                      child: Text(label));
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
