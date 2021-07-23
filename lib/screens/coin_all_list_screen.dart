import 'package:cryptocurrency_flutter/main.dart';
import 'package:cryptocurrency_flutter/model/coin_list_model.dart';
import 'package:cryptocurrency_flutter/network/rest_api.dart';
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/utils/app_common.dart';
import 'package:cryptocurrency_flutter/widgets/crypto_dashboard_widget.dart';
import 'package:cryptocurrency_flutter/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CoinAllListScreen extends StatefulWidget {
  @override
  _CoinAllListScreenState createState() => _CoinAllListScreenState();
}

class _CoinAllListScreenState extends State<CoinAllListScreen> {
  ScrollController scrollController = ScrollController();
  int page = 1;
  List<CoinListModel> mainList = [];

  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    fetchAllCoinData();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if (!isLastPage) {
          page++;
          loadMoreData();
        }
      }
    });
  }

  Future fetchAllCoinData() async {
    appStore.setLoading(true);
    getCoinList(page: page, currency: appStore.mSelectedCurrency!.cc.validate()).then((value) {
      mainList.addAll(value);
      setState(() {});
    }).catchError((e) {
      toast(e.toString());
    }).whenComplete(() {
      appStore.setLoading(false);
    });
  }

  Future loadMoreData() async {
    appStore.setLoading(true);
    await getCoinList(page: page, currency: appStore.mSelectedCurrency!.cc.validate()).then((value) {
      if (!mounted) return;
      appStore.setLoading(false);
      mainList.addAll(value);

      isLastPage = false;
      setState(() {});
    }).catchError((e) {
      isLastPage = true;
      toast(e.toString());
    }).whenComplete(() {
      appStore.setLoading(false);
    });
  }

  void animateToTop() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            animateToTop();
          },
          backgroundColor: secondaryColor,
          child: Icon(Icons.vertical_align_top),
        ),
        appBar: AppBar(
          title: Text('lbl_crypto_coins'.translate, style: boldTextStyle()),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: mainList.length,
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CryptoDashboardWidget(index: index, coinListModel: mainList[index]);
              },
            ),
            LoaderWidget().visible(appStore.mIsLoading.validate()),
          ],
        ),
      ),
    );
  }
}
