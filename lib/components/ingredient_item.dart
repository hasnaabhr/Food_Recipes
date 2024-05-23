import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IngredientItem extends StatelessWidget {
  final String quantity, measure, food, imageUrl;

  const IngredientItem({
    super.key,
    required this.quantity,
    required this.measure,
    required this.food,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final mybox = Hive.box('shopping');

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: h * .01,
        horizontal: w * .033,
      ),
      padding: EdgeInsets.all(h * .008),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: w * .2,
              height: h * .1,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: w * .033),
          Expanded(
            child: Text(
              "$food\n$quantity $measure",
              style: TextStyle(
                fontSize: w * .04,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: w * .033),
          ValueListenableBuilder(
            valueListenable: mybox.listenable(),
            builder: (context, box, _) {
              bool exist = box.containsKey(food);
              return GestureDetector(
                onTap: () {
                  if (exist) {
                    mybox.delete(food);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Item deleted")),
                    );
                  } else {
                    String value = '$food $measure $quantity';
                    mybox.put(food, value);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Item added successfully')),
                    );
                  }
                },
                child: Icon(
                  exist
                      ? Icons.remove_circle_outline
                      : Icons.add_circle_outline,
                  size: w * .07,
                  color: exist ? Colors.red : Colors.green,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
