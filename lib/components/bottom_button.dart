import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({required this.onTap, required this.buttonTitle});

  final Function() onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: defaultBottomContainerColour,
            borderRadius: BorderRadius.circular(40)),
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: defaultBottomContainerHeight,
        child: Center(
          child: Text(
            buttonTitle,
            style: defaultLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
