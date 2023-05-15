import 'package:flutter/material.dart';
import 'package:food_ui_kit/constants.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        TextButton(
            onPressed: press,
            style: TextButton.styleFrom(foregroundColor: kActiveColor),
            child: Text("Sell all"))
      ],
    );
  }
}
