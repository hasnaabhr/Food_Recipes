import 'package:flutter/material.dart';
import 'package:foodrecipe/components/circle_button.dart';
import 'package:foodrecipe/components/custom_clip_path.dart';
import 'package:foodrecipe/components/ingredient_list.dart';
import 'package:foodrecipe/components/share.dart';
import 'package:foodrecipe/components/show_detail_dialog.dart';
import 'package:foodrecipe/components/show_table.dart';
import 'package:foodrecipe/components/start_cooking.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DetailsPage extends StatefulWidget {
  final Map<String, dynamic> item;
  const DetailsPage({super.key, required this.item});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    var myBox = Hive.box('saved');
    String time = widget.item['totalTime']?.toString() ?? 'N/A';
    String imageUrl = widget.item['image'] ?? '';
    String label = widget.item['label'] ?? 'No label';
    List<dynamic> ingredients = widget.item['ingredients'] ?? [];

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: h * 0.44,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: h * 0.04,
                  left: w * 0.05,
                  child: const CircleAvatar(
                    child: BackButton(color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: w * 0.05,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text("$time min"),
                  SizedBox(height: h * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => ShareRecipe.share(widget.item['url']),
                        child: const CircleButton(
                          icon: Icons.share,
                          label: 'Share',
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: myBox.listenable(),
                        builder: (context, box, _) {
                          String key = widget.item['label'];
                          bool saved = myBox.containsKey(key);

                          return GestureDetector(
                            onTap: () {
                              if (saved) {
                                myBox.delete(key);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text('Recipe deleted'),
                                  ),
                                );
                              } else {
                                myBox.put(key, key);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text('Recipe saved successfully'),
                                  ),
                                );
                              }
                            },
                            child: CircleButton(
                              icon: saved
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              label: saved ? 'Saved' : 'Save',
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () => ShowDialog.showCalories(
                            widget.item['totalNutrients'], context),
                        child: const CircleButton(
                          icon: Icons.monitor_heart_outlined,
                          label: 'Calories',
                        ),
                      ),
                      GestureDetector(
                        onTap: () => ShowTable.showTable(context),
                        child: const CircleButton(
                          icon: Icons.table_chart_outlined,
                          label: 'Unit Chart',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Direction',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: w * 0.06,
                        ),
                      ),
                      SizedBox(
                        width: w * 0.34,
                        child: ElevatedButton(
                          onPressed: () =>
                              StartCooking.startCooking(widget.item['url']),
                          child: const Text('Start'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.02),
                  Container(
                    color: Colors.white,
                    height: h * 0.07,
                    width: w,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ClipPath(
                            clipper: CustomClipPath(),
                            child: Container(
                              color: Colors.red,
                              child: Text(
                                'Ingredients Required',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: w * 0.05,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.white,
                            child: Center(
                              child: Text('${ingredients.length} Items'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 1.8,
                    child: IngredientList(
                      ingredients: ingredients,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
