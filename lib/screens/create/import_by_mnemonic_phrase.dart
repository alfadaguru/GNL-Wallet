import 'package:cryptocurrency_flutter/screens/create/import_successfully.dart';
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ImportByMnemonicPhrase extends StatefulWidget {
  const ImportByMnemonicPhrase({Key? key}) : super(key: key);

  @override
  _ImportByMnemonicPhraseState createState() => _ImportByMnemonicPhraseState();
}

class _ImportByMnemonicPhraseState extends State<ImportByMnemonicPhrase> {

  FocusNode inputFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 36, right: 36, bottom: 60),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                    'Import by mnemonic phrase',
                    style: titleStyle(context),
                    textAlign: TextAlign.center,
                  )),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Please enter your mnemonic phrase below. This will either be 12 or 24 words in length (separated by spaces)',
                  style: helpText,
                  textAlign: TextAlign.center,
                )),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: TextField(
                    focusNode: this.inputFocus,
                    maxLines: 6,
                    decoration: InputDecoration(
                        hintText: 'Mnemonic phrase',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(119, 119, 119, 1),)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(119, 119, 119, 1),)
                      ),
                      hintStyle: helpText.copyWith(
                        fontSize: 15
                      ),

                    ),
                    style: whiteText,
                  ),
                ),
              ),
            ),
            PrimaryButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImportSuccessfullyScreen()));
            }, text: 'Continue')

          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    inputFocus.unfocus();
    inputFocus.dispose();
    super.dispose();
  }
}
