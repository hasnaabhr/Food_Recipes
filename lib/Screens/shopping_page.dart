import 'package:flutter/material.dart';
import 'package:foodrecipe/components/custom_appbar.dart';
import 'package:foodrecipe/components/share.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    var myBox = Hive.box('shopping');

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Shopping',
        back: false,
      ),
      body: ValueListenableBuilder(
        valueListenable: myBox.listenable(),
        builder: ((context, box, _) {
          var keys = box.keys.toList();
          var data = box.values.toList();
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Container(
                  height: h * .085,
                  color: Colors.grey[100],
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(data[index]),
                      ),
                      PopupMenuButton(
                        itemBuilder: (context) {
                          return const [
                            PopupMenuItem(
                              value: 'share',
                              child: Text('Share'),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            ),
                          ];
                        },
                        onSelected: (String value) async {
                          if (value == 'delete') {
                            await deleteItem(keys[index]);
                          } else if (value == 'share') {
                            ShareRecipe.share(data[index]);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        }),
      ),
    );
  }

  Future<void> deleteItem(dynamic key) async {
    var myBox = Hive.box('shopping');
    await myBox.delete(key);
  }
}
