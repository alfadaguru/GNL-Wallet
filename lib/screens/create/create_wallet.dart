

import 'package:flutter/material.dart';

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
      appBar: AppBar(
      ),
      body: Column(
        children: [
          Text('Create Wallet', style: Theme.of(context).textTheme.headline6),
          Image.asset('images/app_images/office.png'),
          Expanded(child:
            Column(
              children: [
                Image.asset('images/app_images/logo.png'),
                ElevatedButton(
                  child: Text('Create a new wallet'),
                  onPressed: () {

                  },
                ),

                ElevatedButton(
                  child: Text('I already have a Wallet'),
                  onPressed: () {

                  },
                ),
                SizedBox(height: 50,),
                Row(
                  children: [
                    Checkbox(value: this.checkboxChecked, onChanged: (value) {
                      this.checkboxChecked = value;
                    })
                  ],
                )
              ],
            )
          ),

        ],
      ),
    );
  }
}
