
import 'package:cryptocurrency_flutter/screens/swap.dart';
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AddTokenScreen extends StatefulWidget {
  const AddTokenScreen({Key? key}) : super(key: key);

  @override
  _AddTokenScreenState createState() => _AddTokenScreenState();
}

class _AddTokenScreenState extends State<AddTokenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add custom token'),
        actions: [
          Container(
            width: 32,
            margin: EdgeInsets.only(right: 25),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"
              ),
              backgroundColor: Colors.red,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 26, right: 22, bottom: 60, top: 40),
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: gray)
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(child: Text('Network', style: TextStyle(color: grayColor, fontSize: 17))),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              width: 22,
                              height: 22,
                              child: Image.asset('images/app_images/logo.png'),
                            ),
                            Text('Wow', style: whiteText),
                            Icon(Icons.chevron_right),

                          ],
                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: gray
                                )
                            ),
                            hintText: 'Contact Address',
                            hintStyle: helpText
                        ),
                        style: whiteText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: gray
                                )
                            ),
                            hintText: 'Name',
                            hintStyle: helpText
                        ),
                        style: whiteText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: gray
                                )
                            ),
                            hintText: 'Symbol',
                            hintStyle: helpText
                        ),
                        style: whiteText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: gray
                                )
                            ),
                            hintText: 'Decimals',
                            hintStyle: helpText
                        ),
                        style: whiteText,
                      ),
                    ),
                  ],

                ),
              ),
            )),
            Container(
              child: PrimaryButton(
                text: 'Add token',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SwapScreen()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
