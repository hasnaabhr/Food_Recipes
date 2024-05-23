import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final String title;
  final bool back;
  const CustomAppBar({super.key, required this.title, required this.back});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: w * .06,
          letterSpacing: 2,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.redAccent,
      // ignore: prefer_const_constructors
      leading: back?BackButton(color: Colors.white,):null,
    );
  }

  @override
  Widget get child => throw UnimplementedError();
}
