import 'package:flutter/material.dart';

class ImportByMnemonicPhrase extends StatefulWidget {
  const ImportByMnemonicPhrase({Key? key}) : super(key: key);

  @override
  _ImportByMnemonicPhraseState createState() => _ImportByMnemonicPhraseState();
}

class _ImportByMnemonicPhraseState extends State<ImportByMnemonicPhrase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: [
          Text('Import by mnemonic phrase'),
          Text('Please enter your mnemonic phrase below. This will either be 12 or 24 words in length (separated by spaces)'),

          Expanded(
            child:  TextField(
              maxLines: 6,
              decoration: InputDecoration(hintText: 'Mnemonic phrase'),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Continue'))
        ],
      ),
    );
  }
}
