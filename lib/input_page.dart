import 'package:bmi/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  double height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          style: defaultAppTitleTextStyle,
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          //male card
                          Expanded(
                            child: ReusableCard(
                              onPress: () {
                                setState(() {
                                  selectedGender = Gender.male;
                                });
                              },
                              colour: selectedGender == Gender.male
                                  ? defaultActiveCardColour
                                  : defaultInactiveCardColour,
                              cardChild: iconContent(
                                  icon: FontAwesomeIcons.mars,
                                  label: 'Male',
                                  colour: selectedGender == Gender.male
                                      ? defaultActiveIconColour
                                      : defaultInactiveIconColour),
                            ),
                          ),
                          //female card
                          Expanded(
                            child: ReusableCard(
                                onPress: () {
                                  setState(() {
                                    selectedGender = Gender.female;
                                  });
                                },
                                colour: selectedGender == Gender.female
                                    ? defaultActiveCardColour
                                    : defaultInactiveCardColour,
                                cardChild: iconContent(
                                    icon: FontAwesomeIcons.venus,
                                    label: 'Female',
                                    colour: selectedGender == Gender.female
                                        ? defaultActiveIconColour
                                        : defaultInactiveIconColour)),
                          ),
                        ],
                      ),
                    ),
                    //height card
                    Expanded(
                      child: ReusableCard(
                        colour: defaultActiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'HEIGHT',
                              style: defaultLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.baseline,
                              //textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  height.toString(),
                                  style: defaultNumberTextStyle,
                                ),
                                const Text(
                                  'cm',
                                  style: defaultLabelTextStyle,
                                )
                              ],
                            ),
                            Slider(
                              value: height,
                              min: 120.0,
                              max: 220.0,
                              divisions: 160,
                              label: "$height",
                              onChanged: (double newValue) {
                                setState(() {
                                  height =
                                      double.parse(newValue.toStringAsFixed(1));
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ReusableCard(
                              colour: defaultActiveCardColour,
                              cardChild: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'WEIGHT',
                                    style: defaultLabelTextStyle,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        weight.toString(),
                                        style: defaultNumberTextStyle,
                                      ),
                                      const Text('KG',
                                          style: defaultLabelTextStyle),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPress: () {
                                          setState(() {
                                            weight > 1 ? weight-- : weight = 1;
                                          });
                                        },
                                      ),
                                      const SizedBox(width: 30),
                                      RoundIconButton(
                                        icon: FontAwesomeIcons.plus,
                                        onPress: () {
                                          setState(() {
                                            weight < 300
                                                ? weight++
                                                : weight = 300;
                                          });
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: ReusableCard(
                              colour: defaultActiveCardColour,
                              cardChild: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'AGE',
                                    style: defaultLabelTextStyle,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        age.toString(),
                                        style: defaultNumberTextStyle,
                                      ),
                                      const Text(
                                        'yrs',
                                        style: defaultLabelTextStyle,
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPress: () {
                                          setState(() {
                                            age > 1 ? age-- : age = 1;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      RoundIconButton(
                                        icon: FontAwesomeIcons.plus,
                                        onPress: () {
                                          setState(() {
                                            age < 110 ? age++ : age = 110;
                                          });
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultsPage()));
                      },
                      child: Container(
                        color: defaultBottomContainerColour,
                        margin: const EdgeInsets.only(top: 10),
                        width: double.infinity,
                        height: defaultBottomContainerHeight,
                        child: const Center(
                          child: Text(
                            'Calculate',
                            style: defaultNumberTextStyle,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onPress});

  final IconData? icon;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: Colors.orange,
      elevation: 0,
      onPressed: onPress,
      child: Icon(icon),
    );
  }
}
