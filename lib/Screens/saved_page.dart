import 'package:flutter/material.dart';
import 'package:foodrecipe/components/custom_appbar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:share_plus/share_plus.dart'; // Ensure you have this package in your pubspec.yaml

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    var myBox = Hive.box('saved');

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Saved',
        back: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ValueListenableBuilder(
            valueListenable: myBox.listenable(),
            builder: (context, box, _) {
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  var data = box.values.toList();
                  String item = data[index];
                  return ListTile(
                    title: Container(
                      height: h * .085,
                      color: Colors.grey[100],
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(item),
                          ),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              if (value == 'share') {
                                Share.share(item);
                              } else if (value == 'delete') {
                                myBox.deleteAt(index);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Item deleted')),
                                );
                              }
                            },
                            itemBuilder: (context) {
                              return [
                                const PopupMenuItem(
                                  value: 'share',
                                  child: Text('Share'),
                                ),
                                const PopupMenuItem(
                                  value: 'delete',
                                  child: Text('Delete'),
                                ),
                              ];
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
