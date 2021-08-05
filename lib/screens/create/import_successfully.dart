
import 'package:cryptocurrency_flutter/screens/add_token.dart';
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../home_screen.dart';

class ImportSuccessfullyScreen extends StatefulWidget {
  const ImportSuccessfullyScreen({Key? key}) : super(key: key);

  @override
  _ImportSuccessfullyScreenState createState() => _ImportSuccessfullyScreenState();
}

class _ImportSuccessfullyScreenState extends State<ImportSuccessfullyScreen> {
  @override
  Widget build(BuildContext context) {
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
                    'Your wallet was successfully imported',
                    style: titleStyle(context),
                    textAlign: TextAlign.center,
                  )),
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 40),
                child: Image.asset("images/app_images/success.png")),

            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text('Enable Face ID or Touch ID?', style: whiteText,),
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child:  Image.asset("images/app_images/face.png"),
              ),
            ),
            PrimaryButton(
              text: 'Done',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            )
          ],
        ),
      )
    );
  }
}
