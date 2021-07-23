import 'package:cryptocurrency_flutter/model/coin_detail_model.dart';
import 'package:cryptocurrency_flutter/utils/app_common.dart';
import 'package:cryptocurrency_flutter/utils/app_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class ExchangeScreen extends StatefulWidget {
  List<Ticker> ticker;

  ExchangeScreen({required this.ticker});

  @override
  _ExchangeScreenState createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  BannerAd? myBanner;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    myBanner = buildBannerAd()..load();
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
          title: Text('lbl_exchanges'.translate, style: boldTextStyle()),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 100, child: Text('lbl_exch'.translate, style: primaryTextStyle(size: 14), textAlign: TextAlign.center)).expand(),
                      Container(width: 60, child: Text('lbl_pair'.translate, style: primaryTextStyle(size: 14), textAlign: TextAlign.center)).expand(),
                      Container(width: 80, child: Text('lbl_price'.translate, style: primaryTextStyle(size: 14), textAlign: TextAlign.center)).expand(),
                      Container(width: 80, child: Text('lbl_24H_volume'.translate, style: primaryTextStyle(size: 14), textAlign: TextAlign.center)).expand(),
                    ],
                  ).paddingAll(8),
                  Divider(height: 0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.ticker.length,
                    itemBuilder: (context, index) {
                      Ticker data = widget.ticker[index];
                      return Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${data.market!.name.validate()}', style: primaryTextStyle(size: 14)),
                                    4.height,
                                    Container(
                                      width: 8,
                                      height: 8,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(color: data.trust_score?.validate(value: 'tra').getExchangeColor, shape: BoxShape.circle),
                                    )
                                  ],
                                )).expand(),
                            Container(width: 60, child: Text('${data.base.validate()}\n${data.target.validate()}', style: primaryTextStyle(size: 14), textAlign: TextAlign.center)).expand(),
                            Container(width: 80, child: Text('${data.converted_last!.usd.validate()}', style: primaryTextStyle(size: 14), textAlign: TextAlign.right)).expand(),
                            Container(width: 80, child: Text('${data.converted_volume!.usd.validate().amountPrefix}', style: primaryTextStyle(size: 14), textAlign: TextAlign.right)).expand(),
                          ],
                        ),
                      ).onTap(() {
                        showMoreDetail(data);
                      });
                    },
                  ),
                ],
              ),
            ),
            if (myBanner != null)
              Positioned(
                child: AdWidget(ad: myBanner!),
                bottom: 0,
                left: 0,
                right: 0,
                height: AdSize.banner.height.toDouble(),
              ),
          ],
        ),
      ),
    );
  }

  void showMoreDetail(Ticker data) {
    showGeneralDialog(
        context: context,
        pageBuilder: (context, anim1, anim2) {
          return Container();
        },
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.4),
        barrierLabel: '',
        transitionBuilder: (context, anim1, anim2, child) {
          return Transform.scale(
            scale: anim1.value,
            child: AlertDialog(
              contentPadding: EdgeInsets.symmetric(vertical: 16),
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
              title: Text('${data.market!.name.validate()}', style: boldTextStyle(size: 20)),
              content: Container(
                width: context.width(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButton(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: TextIcon(
                        prefix: Icon(
                          Icons.credit_card,
                          size: 16,
                          color: Colors.white,
                        ),
                        expandedText: true,
                        text: '${data.base.validate()}/${data.target.validate()}',
                      ),
                      onTap: () {
                        if (data.trade_url.isEmptyOrNull) {
                          toast("You cannot trade");
                          return;
                        }
                        AppCommon.launchUrl(data.trade_url.validate());
                      },
                    ).paddingSymmetric(horizontal: 24),
                    16.height,
                    SettingItemWidget(
                      title: 'Base Price',
                      titleTextStyle: primaryTextStyle(),
                      trailing: Text('${data.converted_last!.usd.validate()}', style: secondaryTextStyle()),
                    ),
                    Divider(height: 0),
                    SettingItemWidget(
                      title: 'Target Price',
                      titleTextStyle: primaryTextStyle(),
                      trailing: Text('${data.last!.validate()}', style: secondaryTextStyle()),
                    ),
                    Divider(height: 0),
                    SettingItemWidget(
                      title: 'Base Volume',
                      titleTextStyle: primaryTextStyle(),
                      trailing: Text('${data.converted_volume!.usd.validate()}', style: secondaryTextStyle()),
                    ),
                    Divider(height: 0),
                    SettingItemWidget(
                      title: 'Target Volume',
                      titleTextStyle: primaryTextStyle(),
                      trailing: Text('${data.volume.validate()}', style: secondaryTextStyle()),
                    ),
                    Divider(height: 0),
                    SettingItemWidget(
                      title: '24H Volume',
                      titleTextStyle: primaryTextStyle(),
                      trailing: Text('${data.bid_ask_spread_percentage.validate()}', style: secondaryTextStyle()),
                    ),
                    Divider(height: 16),
                    Row(
                      children: [
                        Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: data.trust_score?.getExchangeColor),
                        ),
                        16.width,
                        Text(data.trust_score.validate().getExchangeStatus, style: primaryTextStyle()).expand(),
                      ],
                    ).paddingLeft(8),
                    16.height,
                  ],
                ),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 300));
  }
}
