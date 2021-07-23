import 'package:cryptocurrency_flutter/main.dart';
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';

class MarketTypeComponent extends StatefulWidget {
  const MarketTypeComponent({
    Key? key,
  }) : super(key: key);

  @override
  _MarketTypeComponentState createState() => _MarketTypeComponentState();
}

class _MarketTypeComponentState extends State<MarketTypeComponent> {
  int selectedValue = -1;

  @override
  void initState() {
    selectedValue = getIntAsync(SharedPreferenceKeys.MARKET_TYPE_SELECTED_INDEX, defaultValue: 1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      child: HorizontalList(
        itemCount: ChartMarketType.values.length,
        itemBuilder: (BuildContext context, int index) {
          bool isSelected = index == selectedValue;
          return Container(
            decoration: boxDecorationWithShadow(
              backgroundColor: isSelected ? secondaryColor : cardColor,
              borderRadius: radius(),
            ),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              '${ChartMarketType.values[index].toString().splitAfter('.').capitalizeFirstLetter()}',
              style: primaryTextStyle(size: 12),
            ),
          ).onTap(() {
            selectedValue = index;
            setIntAsync(SharedPreferenceKeys.MARKET_TYPE_SELECTED_INDEX, index);
            chartStore.setSelectedChartMarketType(ChartMarketType.values[index]);

            setState(() {});
          });
        },
      ),
    );
  }
}
