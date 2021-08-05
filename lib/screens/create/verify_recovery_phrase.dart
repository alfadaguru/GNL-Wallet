import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/widgets/primary_button.dart';
import 'package:cryptocurrency_flutter/widgets/secondary_button.dart';
import 'package:flutter/material.dart';

import '../home_screen.dart';

class VerifyRecoveryPhrase extends StatefulWidget {
  const VerifyRecoveryPhrase({Key? key}) : super(key: key);

  @override
  _VerifyRecoveryPhraseState createState() => _VerifyRecoveryPhraseState();
}

class _VerifyRecoveryPhraseState extends State<VerifyRecoveryPhrase> {

  List<String> tappedWords = [];

  @override
  Widget build(BuildContext context) {
    List<String> words = [
      "Sliver fox",
      "Hyena",
      "Horse",
      "Fish",
      "Ermine",
      "Turtle",
      "Chicken",
      "Children",
      "Widget",
      "Bird",
      "Sand",
      "Monkey"
    ];
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 36, right: 36, bottom: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                    'Verify recovery phrase',
                    style: titleStyle(context),
                    textAlign: TextAlign.center,
                  )),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Tap the words to put them next to each other in the correct order.',
                  style: helpText,
                  textAlign: TextAlign.center,
                )),

            Container(
              height: 225,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(119, 119, 119, 1),
                )
              ),
              child: GridView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      tappedWords.remove(tappedWords[index]);
                      setState(() {

                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(119, 119, 119, 1),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: Center(
                          child: Text(
                            tappedWords[index],
                            style: whiteText,
                          )),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 94 / 34, mainAxisSpacing: 8, crossAxisSpacing: 9),
                itemCount: tappedWords.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0, bottom: 35),
              child: GridView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      var search = tappedWords.where((element) => element == words[index]);
                      if (search.isEmpty) {
                        tappedWords.add(words[index]);
                      } else {
                        tappedWords.remove(words[index]);
                      }
                      setState(() {

                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(119, 119, 119, 1),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: Center(
                          child: Text(
                            words[index],
                            style: whiteText,
                          )),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 94 / 34, mainAxisSpacing: 8, crossAxisSpacing: 9),
                itemCount: words.length,
              ),
            ),

            Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PrimaryButton(text: 'Done', onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                      })
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
