import 'package:cryptocurrency_flutter/main.dart';
import 'package:cryptocurrency_flutter/model/currency_model.dart';
import 'package:cryptocurrency_flutter/network/rest_api.dart';
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/utils/app_constant.dart';
import 'package:cryptocurrency_flutter/utils/app_functions.dart';
import 'package:cryptocurrency_flutter/widgets/selected_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';

class CurrencySelectionScreen extends StatefulWidget {
  @override
  _CurrencySelectionScreenState createState() => _CurrencySelectionScreenState();
}

class _CurrencySelectionScreenState extends State<CurrencySelectionScreen> {
  int selectedIndex = -1;
  BannerAd? myBanner;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    selectedIndex = getIntAsync(SharedPreferenceKeys.SELECTED_CURRENCY_INDEX, defaultValue: 0);
    myBanner = buildBannerAd()..load();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Currencies', style: boldTextStyle()),
        ),
        body: SnapHelperWidget<List<CurrencyModel>>(
          future: getCurrencies,
          onSuccess: (snap) {
            return Stack(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: snap.length,
                  itemBuilder: (context, index) {
                    CurrencyModel data = snap[index];

                    bool isSelected = index == selectedIndex;

                    return SettingItemWidget(
                      decoration: BoxDecoration(color: isSelected ? secondaryColor.withOpacity(0.2) : null),
                      onTap: () {
                        setIntAsync(SharedPreferenceKeys.SELECTED_CURRENCY_INDEX, index);

                        selectedIndex = index;

                        appStore.setSelectedCurrency(data);

                        setState(() {});
                      },
                      subTitle: data.cc.validate(),
                      leading: Container(
                        padding: EdgeInsets.all(8),
                        decoration: boxDecorationWithShadow(backgroundColor: cardColor, borderRadius: radius()),
                        width: 50,
                        child: Text("${data.symbol.validate()}", style: primaryTextStyle(size: 16)).center(),
                      ),
                      trailing: isSelected ? SelectedItemWidget() : Offstage(),
                      title: data.name.validate(),
                    );
                  },
                ),
                if (myBanner != null)
                  Positioned(
                    child: AdWidget(ad: myBanner!),
                    bottom: 0,
                    left: 0,
                    height: AdSize.banner.height.toDouble(),
                    width: context.width(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
