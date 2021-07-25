
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class ReceiveScreen extends StatefulWidget {
  const ReceiveScreen({Key? key}) : super(key: key);

  @override
  _ReceiveScreenState createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  final String text = 'UASDJKJAKDJOUQOEUOSIDOQUWOE';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receive'),
        actions: [
          Container(
            width: 32,
            margin: EdgeInsets.only(right: 25),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 26, right: 22, bottom: 60, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Expanded(child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/app_images/bitcoin.png'),
                  SizedBox(height: 10,),
                  Text('Bitcoin', style: TextStyle(color: Colors.white, fontSize: 19),)
                ]
              ),
            )),
            Container(
              child: TextFormField(
                initialValue: text,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Address',
                  suffixIcon: IconButton(
                    color: gray,
                    icon: Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: text ));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Token is copied to clipboard!')));
                    },
                  ),
                  labelStyle: TextStyle(color: gray)
                ),
                style: TextStyle(color: gray),

              )
            ),
            Expanded(child: Container(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: Image.asset('images/app_images/qr.png'),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
