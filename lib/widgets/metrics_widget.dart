import 'package:cryptocurrency_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MetricsWidget extends StatelessWidget {
  final String value;
  final String name;
  final Color? color;
  final bool isCurrencyAllowed;
  final int divisibleBy;

  MetricsWidget({required this.value, required this.name, this.color, this.isCurrencyAllowed = true, this.divisibleBy = 2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF797979),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name.validate(), style: secondaryTextStyle()).expand(),
          isCurrencyAllowed
              ? FittedBox(child: Text('${appStore.mSelectedCurrency!.symbol.validate()}${value.validate()}', style: primaryTextStyle(color: color ?? textPrimaryColorGlobal)))
              : FittedBox(child: Text('${value.validate()}', style: primaryTextStyle(color: color ?? textPrimaryColorGlobal))),
        ],
      ),
    );
  }
}
