import 'package:cryptocurrency_flutter/utils/app_common.dart';
import 'package:cryptocurrency_flutter/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.gifWithName, scale: 3),
                  SnapHelperWidget<PackageInfo>(
                    future: PackageInfo.fromPlatform(),
                    onSuccess: (data) {
                      return Text('${'lbl_Version'.translate} ${data.version}', style: secondaryTextStyle());
                    },
                  ),
                  16.height,
                ],
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 0,
                child: Text(AppURLs.copyRight, style: secondaryTextStyle()).center(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
