import 'package:flutter/material.dart';

class VerifyRecoveryPhrase extends StatefulWidget {
  const VerifyRecoveryPhrase({Key? key}) : super(key: key);

  @override
  _VerifyRecoveryPhraseState createState() => _VerifyRecoveryPhraseState();
}

class _VerifyRecoveryPhraseState extends State<VerifyRecoveryPhrase> {
  @override
  Widget build(BuildContext context) {
    List<String> words = ["Sliver fox", "Hyena", "Horse", "Fish", "Ermine", "Turtle"];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('Verify recovery phrase'),
          Text('Tap the words to put them next to each other in the correct order'),


          Container(
            height: 255,
          ),

          GridView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Text(words[index]),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: words.length,
          ),

          ElevatedButton(onPressed: () {}, child: Text('Done'))

        ],
      ),
    );
  }
}
