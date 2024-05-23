import 'package:flutter/material.dart';
import 'package:foodrecipe/components/home_appbar.dart';
import 'package:foodrecipe/components/tab_bar_widget.dart';
import 'package:foodrecipe/components/text_field_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                SizedBox(height: h * .022),
                const TextFieldWidget(),
                SizedBox(height: h * .022),
                Container(
                  height: h * .25,
                  width: w,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/Restaurant Logo » SOSFactory.jpeg'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                ),
                SizedBox(
                  height: h * .023,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                          fontSize: w * .045, fontWeight: FontWeight.bold),
                    ),
                    const Text('see all'),
                    // SizedBox(
                    //   width: w * .022,
                    // ),
                  ],
                ),
                SizedBox(
                  height: h * .022,
                ),
                const TabBarWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
