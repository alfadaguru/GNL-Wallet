import 'package:cryptocurrency_flutter/screens/create/verify_recovery_phrase.dart';
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/widgets/primary_button.dart';
import 'package:cryptocurrency_flutter/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecoveryPhraseScreen extends StatefulWidget {
  const RecoveryPhraseScreen({Key? key}) : super(key: key);

  @override
  _RecoveryPhraseScreenState createState() => _RecoveryPhraseScreenState();
}

class _RecoveryPhraseScreenState extends State<RecoveryPhraseScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> words = [
      "Horse",
      "Sand",
      "Monkey",
      "Fish",
      "Ermine",
      "Bird",
      "Turtle",
      "Chicken",
      "Sliver fox",
      "Hyena",
      "Children",
      "Widget",
    ];
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 36, right: 36, bottom: 60),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                'Your recovery phrase',
                style: titleStyle(context),
                textAlign: TextAlign.center,
              )),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Write down or copy these words in the right order and save them somewhere safe',
                  style: helpText,
                  textAlign: TextAlign.center,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 55.0, bottom: 55),
              child: GridView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 26),
                        child: SecondaryButton(onPressed: () {
                          Clipboard.setData(ClipboardData(text: words.join(',')));
                          var msg = SnackBar(content: Text('Words are copied to clipboard!'));
                          ScaffoldMessenger.of(context).showSnackBar(msg);
                        }, text: 'Copy'))),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 26),
                        child: SecondaryButton(onPressed: () {}, text: 'Show QR'))),
              ],
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      'Never share recovery phrase with anyone, store it securely!',
                      style: helpText,
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 30),
                  ),
                  PrimaryButton(text: 'Continue', onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => VerifyRecoveryPhrase()));
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
