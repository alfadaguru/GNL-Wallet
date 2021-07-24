import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({Key? key, this.onPressed, this.text}) : super(key: key);

  final void Function()? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(23)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(11, 59, 130, 1),
              Color.fromRGBO(38, 108, 254, 1),
            ]
          )
        ),
        child: Container(
          padding: EdgeInsets.only(top: 15, bottom: 12),
          child: Center(child: Text(this.text!, style: whiteText)),
        ),
      ),
      onTap: onPressed,
    );
  }
}
