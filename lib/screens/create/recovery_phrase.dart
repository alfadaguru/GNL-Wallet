import 'package:flutter/material.dart';

class RecoveryPhraseScreen extends StatefulWidget {
  const RecoveryPhraseScreen({Key? key}) : super(key: key);

  @override
  _RecoveryPhraseScreenState createState() => _RecoveryPhraseScreenState();
}

class _RecoveryPhraseScreenState extends State<RecoveryPhraseScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> words = ["Sliver fox", "Hyena", "Horse", "Fish", "Ermine", "Turtle"];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('Your recovery phrase'),
          Text('Write down or copy thesse wwords in the right orrder and save them somewhere safe'),
          GridView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Text(words[index]),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: words.length,
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Copy')),
              ElevatedButton(onPressed: () {}, child: Text('Show QR')),
            ],
          ),
          Text('Never share recovery phrase with anyone, store it securely!'),
          ElevatedButton(child: Text('Continue'), onPressed: () {})
        ],
      ),
    );
  }
}
