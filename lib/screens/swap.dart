import 'package:cryptocurrency_flutter/screens/send.dart';
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SwapScreen extends StatefulWidget {
  const SwapScreen({Key? key}) : super(key: key);

  @override
  _SwapScreenState createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swap'),
        actions: [
          Container(
            width: 32,
            margin: EdgeInsets.only(right: 25),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 26, right: 22, bottom: 60, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: gray)
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text('From', style: TextStyle(fontSize: 15, color: gray, fontWeight: FontWeight.bold ),)),
                        Row(
                          children: [
                            Container(
                              width: 22,
                              margin: EdgeInsets.only(right: 10),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    "images/app_images/bitcoin.png"
                                ),
                                backgroundColor: Colors.red,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text('Bitcoin', style: TextStyle(color: Colors.white, fontSize: 19),)
                            ),

                            IconButton(onPressed: () {

                            }, icon: Icon(Icons.keyboard_arrow_down_sharp)),

                            Expanded(child: TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none
                              ),
                              style: whiteText,
                            )),
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('BTC', style: TextStyle(color: Colors.white, fontSize: 19),)
                            ),

                          ],

                        ),

                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 22),
                    child: Center(
                      child: IconButton(
                        icon: Icon(Icons.swap_vert),
                        onPressed: () {

                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: gray)
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text('To', style: TextStyle(fontSize: 15, color: gray, fontWeight: FontWeight.bold ),)),
                        Row(
                          children: [
                            Container(
                              width: 22,
                              margin: EdgeInsets.only(right: 10),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    "images/app_images/logo.png"
                                ),
                                backgroundColor: Colors.red,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text('WOW', style: TextStyle(color: Colors.white, fontSize: 19),)
                            ),

                            IconButton(onPressed: () {

                            }, icon: Icon(Icons.keyboard_arrow_down_sharp)),

                            Expanded(child: Text('20 wow', style: TextStyle(color: Colors.white, fontSize: 19), textAlign: TextAlign.right,))


                          ],

                        ),

                      ],
                    ),
                  ),
                ],

              )
            )),
            Container(
              child: PrimaryButton(
                text: 'Swap',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SendScreen()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
