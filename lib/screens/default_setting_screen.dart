import 'package:cryptocurrency_flutter/main.dart';
import 'package:cryptocurrency_flutter/model/default_setting.dart';
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/utils/app_constant.dart';
import 'package:cryptocurrency_flutter/utils/app_common.dart';
import 'package:cryptocurrency_flutter/widgets/selected_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DefaultSettingScreen extends StatefulWidget {
  @override
  _DefaultSettingScreenState createState() => _DefaultSettingScreenState();
}

class _DefaultSettingScreenState extends State<DefaultSettingScreen> {
  int chartMarketDefaultTypeIndex = -1;
  int colorIndex = -1;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    chartMarketDefaultTypeIndex = getIntAsync(SharedPreferenceKeys.MARKET_TYPE_SELECTED_INDEX);
    colorIndex = AppConstant.gradientColor.indexOf(appStore.mSelectedGraphColor);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('lbl_default_settings'.translate, style: boldTextStyle()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SettingSection(
                headingDecoration: BoxDecoration(color: cardColor),
                divider: Offstage(),
                title: Text('lbl_chart_market_default_type'.translate, style: boldTextStyle()),
                items: List.generate(DefaultSetting.getChartMarketDefaultType.length, (index) {
                  DefaultSetting data = DefaultSetting.getChartMarketDefaultType[index];
                  bool isSelected = chartMarketDefaultTypeIndex == index;
                  return SettingItemWidget(
                    onTap: () {
                      setIntAsync(SharedPreferenceKeys.MARKET_TYPE_SELECTED_INDEX, index);
                      chartMarketDefaultTypeIndex = index;
                      setState(() {});
                    },
                    title: '${data.name.validate()}',
                    trailing: isSelected.validate() ? SelectedItemWidget() : Offstage(),
                  );
                }),
              ),
              SettingSection(
                headingDecoration: BoxDecoration(color: cardColor),
                divider: Offstage(),
                title: Text('lbl_chart_default_color'.translate, style: boldTextStyle()),
                items: [
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: List.generate(AppConstant.gradientColor.length, (index) {
                      Color data = AppConstant.gradientColor[index];
                      bool isSelected = colorIndex == index;
                      return Stack(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 800),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(color: isSelected ? data.withOpacity(0.7) : data, borderRadius: radius(20)),
                            height: 80,
                            width: 80,
                            alignment: Alignment.centerRight,
                            child: isSelected
                                ? SelectedItemWidget(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: defaultBoxShadow(),
                                    ),
                                    itemSize: 18,
                                  ).center()
                                : Offstage(),
                          ).onTap(
                            () {
                              appStore.setSelectedGraphColor(data);
                              colorIndex = index;
                              setState(() {});
                            },
                          ),
                        ],
                      );
                    }),
                  ).paddingSymmetric(vertical: 16, horizontal: 8)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
