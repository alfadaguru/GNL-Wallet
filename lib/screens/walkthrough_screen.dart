import 'package:cryptocurrency_flutter/screens/home_screen.dart';
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:nb_utils/nb_utils.dart';

import 'create/create_wallet.dart';

class WalkThroughScreen extends StatefulWidget {
  @override
  _WalkThroughScreenState createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;

  List<WalkThroughModelClass> page = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    page.add(WalkThroughModelClass(image: 'images/app_images/walk1.png', title: "Seamless Wallet Control", subTitle: "Fast transactions, realtime crypto currencies market value, and smart notifications."));
    page.add(WalkThroughModelClass(image: 'images/app_images/walk2.png', title: "Safe and Secure", subTitle: "All financial data are safely and securely stored in our system."));
    page.add(WalkThroughModelClass(image: 'images/app_images/walk3.png', title: "Backup Your Wallet", subTitle: "The 12 words seed phrase allows you to recover your wallet."));
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: page.length,
              onPageChanged: (index) {
                currentPageIndex = index;
                setState(() {});
              },
              itemBuilder: (context, index) {
                WalkThroughModelClass data = page[index];

                return Container(
                  height: context.height(),
                  width: context.width(),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset(AppImages.walkThroughBackgroundImage).image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                          child: Container(
                            width: 240.0,
                            height: 280.0,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: radius(20),
                            ),
                            child: Image.asset(data.image!).center(),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(data.title!.toUpperCase(), style: boldTextStyle(size: 24)),
                          16.height,
                          Text(
                            data.subTitle!,
                            style: secondaryTextStyle(),
                            textAlign: TextAlign.center,
                          ).paddingLeft(8).paddingRight(8),
                        ],
                      ),
                      SizedBox(),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 40,
              left: 40,
              child: DotIndicator(
                pages: page,
                pageController: pageController,
                indicatorColor: secondaryColor,
                unselectedIndicatorColor: secondaryColor.withOpacity(0.5),
              ),
            ),
            Positioned(
              bottom: 26,
              right: 30,
              child: Container(
                height: 50,
                width: 50,
                decoration: boxDecorationDefault(
                  gradient: LinearGradient(
                    colors: [
                      secondaryColor,
                      secondaryColor.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Icon(Icons.arrow_forward, color: Colors.white),
              ).onTap(() async {
                pageController.nextPage(duration: Duration(milliseconds: 550), curve: Curves.decelerate);
              }),
            ),
            Positioned(
              bottom: 26,
              right: 30,
              child: AnimatedCrossFade(
                sizeCurve: Curves.bounceOut,
                crossFadeState: currentPageIndex == 2 ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 550),
                firstChild: Container(
                  height: 50,
                  width: 50,
                  decoration: boxDecorationDefault(
                    gradient: LinearGradient(
                      colors: [
                        secondaryColor,
                        secondaryColor.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: Icon(Icons.arrow_forward, color: Colors.white),
                ).onTap(() async {
                  pageController.nextPage(duration: Duration(milliseconds: 550), curve: Curves.decelerate);
                }),
                secondChild: Container(
                  height: 50,
                  padding: EdgeInsets.all(8),
                  decoration: boxDecorationDefault(
                    gradient: LinearGradient(
                      colors: [
                        secondaryColor,
                        secondaryColor.withOpacity(0.9),
                      ],
                    ),
                  ),
                  child: Text('Get Started', style: boldTextStyle()).center(),
                ).onTap(() {
                  setValue(SharedPreferenceKeys.IS_FIRST, false);

                  // HomeScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Fade, isNewTask: true);
                  CreateWalletScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Fade, isNewTask: true);
                }),
              ),
            ),
            Positioned(
              top: 26,
              right: 30,
              child: TextButton(
                onPressed: () {
                  setValue(SharedPreferenceKeys.IS_FIRST, false);
                  // HomeScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Fade, isNewTask: true);
                  CreateWalletScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Fade, isNewTask: true);
                },
                child: Text('Skip', style: secondaryTextStyle()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
