import 'package:cryptocurrency_flutter/screens/receive.dart';
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({Key? key}) : super(key: key);

  @override
  _SendScreenState createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send'),
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
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: gray))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Currency',
                            style: TextStyle(fontSize: 15, color: gray, fontWeight: FontWeight.bold),
                          )),
                      Row(
                        children: [
                          Container(
                            width: 22,
                            margin: EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              backgroundImage: AssetImage("images/app_images/logo.png"),
                              backgroundColor: Colors.red,
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Text(
                                'WOW',
                                style: TextStyle(color: Colors.white),
                              )),
                          Expanded(
                              child: Text(
                            '20 wow',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.right,
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
                Theme(
                  data: ThemeData(canvasColor: secondaryColor),
                  child: DropdownButtonFormField(
                    value: 1,
                    onChanged: (value) {},
                    style: whiteText,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(borderSide: BorderSide(color: gray)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray)),
                        labelText: 'Contact List',
                        fillColor: Colors.transparent,
                        labelStyle: TextStyle(color: gray, fontSize: 20)),
                    items: [
                      DropdownMenuItem(
                        child: Text('Bessie Cooper'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('Bessie Cooper'),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text('Bessie Cooper'),
                        value: 3,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: gray))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text('Wallet', style: TextStyle(fontSize: 15, color: gray))),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: TextField(
                                  decoration:
                                      InputDecoration(enabledBorder: InputBorder.none, focusedBorder: InputBorder.none),
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white
                                  ),
                                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                                ),

                            ),
                          ),
                          Column(
                            children: [
                              IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),

                              Text(
                                '20 USD',
                                style: TextStyle(color: Colors.white, fontSize: 14),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ))),
            Container(
              child: PrimaryButton(
                text: 'Send',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReceiveScreen()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
