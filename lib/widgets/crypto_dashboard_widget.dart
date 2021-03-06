import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:cryptocurrency_flutter/main.dart';
import 'package:cryptocurrency_flutter/model/coin_list_model.dart';
import 'package:cryptocurrency_flutter/screens/coin_detail_screen.dart';
import 'package:cryptocurrency_flutter/utils/app_common.dart';
import 'package:cryptocurrency_flutter/widgets/cached_network_image.dart';
import 'package:cryptocurrency_flutter/widgets/increment_decrement_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class CryptoDashboardWidget extends StatefulWidget {
  int? index;
  CoinListModel coinListModel;
  CryptoDashboardWidget({this.index, required this.coinListModel});

  @override
  _CryptoDashboardWidgetState createState() => _CryptoDashboardWidgetState();
}

class _CryptoDashboardWidgetState extends State<CryptoDashboardWidget> {
  String previousValue = '';

  @override
  void initState() {
    previousValue = widget.coinListModel.price_change_percentage_1h_in_currency.validate().toStringAsFixed(2);
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          cachedImage(widget.coinListModel.image.validate(), height: 40, width: 40).cornerRadiusWithClipRRect(80),
          12.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Marquee(
                direction: Axis.horizontal,
                directionMarguee: DirectionMarguee.oneDirection,
                child: Text(
                  widget.coinListModel.name.validate(),
                  style: boldTextStyle(),
                ),
              ),
              Text(widget.coinListModel.symbol.validate().toUpperCase(), style: secondaryTextStyle()),
            ],
          ).withWidth(90),
          6.width,
          Sparkline(
            data: widget.coinListModel.sparkline_in_7d!.price.validate(),
            useCubicSmoothing: true,
            cubicSmoothingFactor: 0.2,
            lineGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [widget.coinListModel.price_change_percentage_1h_in_currency.validate().getAmountForColor, widget.coinListModel.price_change_percentage_1h_in_currency.validate().getAmountForColor],
            ),
            fallbackHeight: 45,
          ).expand(flex: 2),
          16.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("${appStore.mSelectedCurrency?.symbol.validate()}${widget.coinListModel.current_price.validate().amountPrefix}", style: boldTextStyle()),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IncrementDecrementWidget(isDecrease: widget.coinListModel.price_change_percentage_1h_in_currency.validate().isNegative, size: 12),
                  6.width,
                  Text(
                    '${widget.coinListModel.price_change_percentage_1h_in_currency.validate().toStringAsFixed(2)}%',
                    style: secondaryTextStyle(color: widget.coinListModel.price_change_percentage_1h_in_currency.validate().getAmountForColor),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    ).onTap(() {
      CoinDetailScreen(
        name: widget.coinListModel.name.validate(),
        id: widget.coinListModel.id.validate(),
      ).launch(context, pageRouteAnimation: PageRouteAnimation.Slide, duration: Duration(milliseconds: 200));
    });
  }
}
