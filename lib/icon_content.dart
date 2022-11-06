import 'package:flutter/material.dart';
import 'constants.dart';

class iconContent extends StatelessWidget {
  const iconContent(
      {required this.icon, required this.label, required this.colour});

  final IconData icon;
  final String label;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: getIconColor(),
          size: 50,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: defaultLabelTextStyle,
        )
      ],
    );
  }

  Color setIconColor({required Color colour}) {
    return colour;
  }

  Color getIconColor() {
    return colour;
  }
}
