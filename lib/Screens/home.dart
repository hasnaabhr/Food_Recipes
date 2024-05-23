import 'package:flutter/material.dart';
import 'package:foodrecipe/Screens/home_page.dart';
import 'package:foodrecipe/Screens/recipe_category.dart';
import 'package:foodrecipe/Screens/saved_page.dart';
import 'package:foodrecipe/Screens/search_page.dart';
import 'package:foodrecipe/Screens/shopping_page.dart';
import 'package:foodrecipe/components/bottom_navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  late PageController pageController;
  int currentIndex = 0;
  final int pageCount = 5; // Number of pages

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedItem: currentIndex,
        onTap: (index) {
          // Ensure the index is within the range of available pages
          if (index >= 0 && index < pageCount) {
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut);
            setState(() {
              currentIndex = index;
            });
          }
        },
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          // Ensure the index is within the range of available pages
          if (index >= 0 && index < pageCount) {
            setState(() {
              currentIndex = index;
            });
          }
        },
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          RecipeCategory(),
          SearchPage(),
          SavedScreen(),
          ShoppingPage(),
        ],
      ),
    );
  }
}
