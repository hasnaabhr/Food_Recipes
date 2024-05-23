import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Text(
          'What are you cooking today',
          style: TextStyle(
            fontSize: w * .05,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
