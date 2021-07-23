import 'package:cryptocurrency_flutter/model/search_model.dart';
import 'package:cryptocurrency_flutter/network/local_db/sqflite_methods.dart';
import 'package:cryptocurrency_flutter/screens/coin_detail_screen.dart';
import 'package:cryptocurrency_flutter/widgets/cached_network_image.dart';
import 'package:cryptocurrency_flutter/utils/app_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';

class CryptoFollowWidget extends StatefulWidget {
  Coin coin;
  int? index;
  final Function() onSuccess;

  CryptoFollowWidget({required this.coin, this.index, required this.onSuccess});

  @override
  _CryptoFollowWidgetState createState() => _CryptoFollowWidgetState();
}

class _CryptoFollowWidgetState extends State<CryptoFollowWidget> {
  bool isFollowing = false;

  @override
  void initState() {
    isFollowing = widget.coin.isFav.validate() == 1;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          cachedImage(widget.coin.large.validate(), height: 40, width: 40),
          12.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.coin.name.validate(), style: boldTextStyle()),
              Text(widget.coin.symbol.validate(), style: boldTextStyle()),
            ],
          ).expand(),
          AppButton(
            padding: EdgeInsets.all(8),
            onTap: () {
              if (isFollowing = !isFollowing) {
                SqliteMethods.updateFavoriteStatus(true, widget.coin).then((value) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  snackBar(
                    context,
                    title: '${'lbl_added'.translate} ${widget.coin.name} ${'lbl_to_favorites'.translate}',
                  );
                }).catchError((e) {
                  toast(e.toString());
                });
              } else {
                SqliteMethods.updateFavoriteStatus(false, widget.coin).then((value) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  snackBar(
                    context,
                    title: '${"lbl_removed".translate} ${widget.coin.name} ${'lbl_from_favorite'.translate}',
                  );
                }).catchError((e) {
                  toast(e.toString());
                });
              }
              widget.onSuccess.call();
            },
            text: isFollowing ? "lbl_remove".translate : "lbl_add".translate,
            textStyle: boldTextStyle(color: Colors.black),
          )
        ],
      ),
    ).onTap(() {
      CoinDetailScreen(name: widget.coin.name.validate(), id: widget.coin.id.validate()).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
    });
  }
}
