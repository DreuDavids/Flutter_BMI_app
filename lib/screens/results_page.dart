import 'package:bmi/components/bottom_button.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {required this.bmiResult,
      required this.resultText,
      required this.analysis});
  final String bmiResult;
  final String resultText;
  final String analysis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          alignment: Alignment.bottomCenter,
                          child: const Text(
                            'Your Result',
                            style: defaultResultTitleTextStyle,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 5,
                          child: ReusableCard(
                            colour: defaultActiveCardColour,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  resultText.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: defaultResultTextStyle,
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'BMI',
                                      style: defaultBMIsubTitleTextStyle,
                                    ),
                                    Text(
                                      bmiResult,
                                      style: defaultBMITextStyle,
                                    ),
                                  ],
                                ),
                                Text(
                                  analysis,
                                  textAlign: TextAlign.center,
                                  style: defaultBodyTextStyle,
                                )
                              ],
                            ),
                          )),
                      BottomButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          buttonTitle: 'RE-CALCULATE'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
