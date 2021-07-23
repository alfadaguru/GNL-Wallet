import 'package:cryptocurrency_flutter/main.dart';
import 'package:cryptocurrency_flutter/model/coin_detail_model.dart';
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/utils/app_common.dart';
import 'package:cryptocurrency_flutter/utils/get_detail_view_currency.dart';
import 'package:cryptocurrency_flutter/widgets/increment_decrement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class CoinDetailComponent extends StatefulWidget {
  CoinDetailModel data;

  CoinDetailComponent({required this.data});

  @override
  _CoinDetailComponentState createState() => _CoinDetailComponentState();
}

class _CoinDetailComponentState extends State<CoinDetailComponent> {
  CoinDetailModel? data;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    data = widget.data;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('lbl_price'.translate, style: secondaryTextStyle()),
                  6.height,
                  Text(
                    '${appStore.mSelectedCurrency!.symbol.validate()}${getPercentageValueInCurrency(widget.data.market_data!.current_price!).validate()}',
                    style: boldTextStyle(size: 16),
                  ),
                ],
              ).expand(),
              6.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('lbl_market_cap'.translate, style: secondaryTextStyle()),
                  6.height,
                  FittedBox(
                    child: Text(
                      '${appStore.mSelectedCurrency!.symbol.validate()}${getPercentageValueInCurrency(widget.data.market_data!.market_cap!).validate().amountPrefix}',
                      style: boldTextStyle(size: 16),
                    ),
                  ),
                ],
              ).expand(),
              6.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('lbl_volume_24H'.translate, style: secondaryTextStyle()),
                  6.height,
                  Text(
                    '${appStore.mSelectedCurrency!.symbol.validate()}${getPercentageValueInCurrency(widget.data.market_data!.total_volume!).validate().amountPrefix}',
                    style: boldTextStyle(size: 16),
                  ),
                ],
              ).expand(),
            ],
          ),
          getPercentageValueInCurrency(widget.data.market_data!.price_change_percentage_1h_in_currency!).validate().isNegative
              ? TextIcon(
                  edgeInsets: EdgeInsets.all(0),
                  suffix: IncrementDecrementWidget(
                    isDecrease: true,
                    size: 8,
                  ),
                  text: '${getPercentageValueInCurrency(widget.data.market_data!.price_change_percentage_1h_in_currency!).validate().toStringAsFixed(2)}%',
                  textStyle: primaryTextStyle(color: dangerColor, weight: FontWeight.w200, size: 18),
                )
              : TextIcon(
                  edgeInsets: EdgeInsets.all(0),
                  suffix: IncrementDecrementWidget(
                    isDecrease: false,
                    size: 8,
                  ),
                  text: '${getPercentageValueInCurrency(widget.data.market_data!.price_change_percentage_1h_in_currency!).validate().toStringAsFixed(2)}%',
                  textStyle: primaryTextStyle(color: successColor, weight: FontWeight.w200),
                ),
        ],
      ),
    );
  }
}
