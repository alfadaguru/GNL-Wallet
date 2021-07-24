import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(20, 20, 22, 1.0);
const secondaryColor = Color.fromRGBO(55, 204, 155, 1.0);
const dangerColor = Color.fromRGBO(247, 71, 104, 1);
const captionColor = Color.fromRGBO(98, 108, 139, 1);
const cardColor = Color(0xFF222224);
// const cardColor = Color(0xFF26293D);
const successColor = Color.fromRGBO(77, 227, 24, 1.0);

const blackColor1 = Color.fromRGBO(16, 6, 31, 1);
const textTitleColor = Colors.white;
const whiteText = const TextStyle(color: Colors.white);
const helpText = const TextStyle(color: Color.fromRGBO(110, 110, 119, 1.0));
TextStyle? Function(BuildContext) titleStyle = (BuildContext context) => Theme.of(context).textTheme.headline6?.copyWith(color: textTitleColor);