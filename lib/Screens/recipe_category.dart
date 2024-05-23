import 'package:flutter/material.dart';
import 'package:foodrecipe/Screens/all_recipe.dart';
import 'package:foodrecipe/components/category_list.dart';
import 'package:foodrecipe/components/recipe_category_view.dart';

class RecipeCategory extends StatelessWidget {
  const RecipeCategory({super.key, });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    // Check list lengths to prevent out of bounds access
    if (name.length < 4 ||
        images.length < 4 ||
        categoryImage.length < 4 ||
        categories.length < 4) {
      return const Scaffold(
        body: Center(
          child: Text('Insufficient data for categories.'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.1),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: h * .06),
            Text(
              'For You',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: w * .06,
              ),
            ),
            SizedBox(height: h * .01),
            SizedBox(
              height: h * .106,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecipeCategoryView(
                    name: name[0],
                    image: images[0],
                  ),
                  RecipeCategoryView(
                    name: name[1],
                    image: images[1],
                  ),
                  RecipeCategoryView(
                    name: name[2],
                    image: images[2],
                  ),
                  RecipeCategoryView(
                    name: name[3],
                    image: images[3],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * .01,
            ),
            Text(
              'For You',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: w * .055,
              ),
            ),
            SizedBox(
              height: h * .45,
              child: GridView.builder(
                itemCount: categoryImage.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: h * .01,
                  mainAxisSpacing: w * .021,
                ),
                itemBuilder: (context, index) {
                  if (index < categories.length) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AllRecipe(recipe: categories[index]),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                categoryImage[index],
                                height: h * .043,
                                width: w * .08,
                              ),
                              SizedBox(
                                height: h * .003,
                              ),
                              Text(
                                categories[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container(); // Placeholder or empty container
                  }
                },
              ),
            ),
            Text(
              'Your Preference',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: w * .055,
              ),
            ),
            SizedBox(
              height: h * .13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecipeCategoryView(name: 'Easy', image: images[0]),
                  RecipeCategoryView(name: 'Quick', image: images[1]),
                  RecipeCategoryView(name: 'Beef', image: images[2]),
                  RecipeCategoryView(name: 'Low Fat', image: images[3]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
