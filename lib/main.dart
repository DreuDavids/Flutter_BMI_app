import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0XFF0A0E21),
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0XFF0A0E21), secondary: Colors.purple),
        //slider theme
        sliderTheme: const SliderThemeData(
          activeTrackColor: defaultActiveSliderColour,
          inactiveTrackColor: defaultInactiveSliderColour,
          thumbColor: defaultSliderThumbColour,
          overlayColor: defaultSliderOverlayColour,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          valueIndicatorColor: defaultSliderValueIndicatorColour,
        ),
      ),
      home: InputPage(),
    );
  }
}
