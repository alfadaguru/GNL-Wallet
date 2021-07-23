import 'package:cryptocurrency_flutter/component/chart_component.dart';
import 'package:cryptocurrency_flutter/component/market_type_component.dart';
import 'package:cryptocurrency_flutter/main.dart';
import 'package:cryptocurrency_flutter/model/coin_chart_model.dart';
import 'package:cryptocurrency_flutter/network/rest_api.dart';
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/utils/app_constant.dart';
import 'package:cryptocurrency_flutter/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class MarketChartComponent extends StatefulWidget {
  String coinId;

  MarketChartComponent({required this.coinId});

  @override
  _MarketChartComponentState createState() => _MarketChartComponentState();
}

class _MarketChartComponentState extends State<MarketChartComponent> {
  List<String> timeChart = ['1m', '1w', '1d', '3m', '1y'];
  int selected = 2;

  ChartMarketType selectedChartMarketType = ChartMarketType.PRICES;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarketTypeComponent(),

        Observer(
          builder: (_) => SnapHelperWidget<CoinChartModel>(
            loadingWidget: LoaderWidget(
              size: 150,
            ).withHeight(280),
            future: getCoinMarket(name: widget.coinId, timeLimit: chartStore.mRangeDifference, currency: appStore.mSelectedCurrency!.cc.validate()),
            onSuccess: (data) {
              return Observer(
                builder: (_) => ChartComponent(
                  coinChart: data,
                  graphColor: appStore.mSelectedGraphColor,
                  selectedChartType: chartStore.mSelectedChartMarketType,
                ),
              );
            },
          ),
        ),
        // HorizontalBarChart(widget.data),
        HorizontalList(
          itemCount: timeChart.length,
          itemBuilder: (context, index) {
            bool isSelected = selected == index;
            return Observer(
              builder: (_) => AnimatedContainer(
                width: 56,
                padding: EdgeInsets.all(8),
                decoration: boxDecorationDefault(
                  gradient: isSelected
                      ? LinearGradient(
                          colors: <Color>[appStore.mSelectedGraphColor.withOpacity(0.5), appStore.mSelectedGraphColor],
                          stops: <double>[0.03, 0.9],
                          end: Alignment.centerLeft,
                          begin: Alignment.centerRight,
                        )
                      : LinearGradient(
                          colors: <Color>[cardColor, cardColor],
                          stops: <double>[0.03, 0.9],
                          end: Alignment.centerLeft,
                          begin: Alignment.centerRight,
                        ),
                  color: appStore.mSelectedGraphColor.withOpacity(0.5),
                  border: isSelected ? Border.all(color: context.dividerColor) : null,
                ),
                duration: Duration(milliseconds: 600),
                curve: Curves.easeIn,
                child: Text(timeChart[index], style: primaryTextStyle()).center(),
              ).onTap(() {
                selected = index;
                chartStore.setIsDateSelected(false);

                if (index == 0) {
                  chartStore.setRangeDifference(30);
                } else if (index == 1) {
                  chartStore.setRangeDifference(7);
                } else if (index == 2) {
                  chartStore.setRangeDifference(1);
                } else if (index == 3) {
                  chartStore.setRangeDifference(90);
                } else if (index == 4) {
                  chartStore.setRangeDifference(180);
                } else if (index == 5) {
                  chartStore.setRangeDifference(365);
                }
                setState(() {});
              }, borderRadius: radius()),
            );
          },
        )
      ],
    );
  }
}
/*    Align(
              alignment: AlignmentDirectional.centerEnd,
              child: DropdownButton<ChartMarketType>(
                dropdownColor: cardColor,
                value: chartStore.mSelectedChartMarketType,
                underline: SizedBox(),
                icon: Icon(Icons.arrow_drop_down),
                elevation: 16,
                items: ChartMarketType.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(ChartMarketType.values[e.index].toString().splitAfter('.').capitalizeFirstLetter(), style: primaryTextStyle(size: 12)),
                      ),
                    )
                    .toList(),
                onChanged: (ChartMarketType? e) async {
                  selectedChartMarketType = e!;
                  chartStore.setSelectedChartMarketType(e);
                },
              ),
            ).paddingRight(16),*/
