import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class LoaderWidget extends StatefulWidget {
  double? size = 200;

  LoaderWidget({this.size});

  @override
  _LoaderWidgetState createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/app_images/loader_logo.gif',
      height: widget.size,
      width: widget.size,
    ).center();
  }
}
