import 'package:cryptocurrency_flutter/screens/create/import_by_mnemonic_phrase.dart';
import 'package:cryptocurrency_flutter/screens/create/recovery_phrase.dart';
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/widgets/primary_button.dart';
import 'package:cryptocurrency_flutter/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CreateWalletScreen extends StatefulWidget {
  const CreateWalletScreen({Key? key}) : super(key: key);

  @override
  _CreateWalletScreenState createState() => _CreateWalletScreenState();
}

class _CreateWalletScreenState extends State<CreateWalletScreen> {
  bool? checkboxChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Create Wallet', style: titleStyle(context)),
          ),
          Image.asset('images/app_images/office.png'),
          Expanded(
              child:  Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: blackColor1,
                ),

                padding: EdgeInsets.only(top: 10, left: 62, right: 62),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(

                      padding: const EdgeInsets.all(60),
                      child: Image.asset('images/app_images/logo.png'),
                    ),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      text: 'Create a new wallet',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecoveryPhraseScreen()));
                      },
                    ),
                    SizedBox(height: 15,),
                    SecondaryButton(
                      text: 'I already have a Wallet',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImportByMnemonicPhrase()));
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Theme(
                          data: ThemeData(unselectedWidgetColor:  Color.fromRGBO(119, 119, 119, 1),),
                          child: Checkbox(
                            activeColor: whiteColor,
                              value: this.checkboxChecked,
                              onChanged: (value) {
                              print('On change ne');

                                setState(() {
                                  this.checkboxChecked = value;
                                });
                              }),
                        ),
                        Text('Term and condition/policy', style: helpText,)
                      ],
                    )
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
