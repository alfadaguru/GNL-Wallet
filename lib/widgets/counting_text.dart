import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class CountingText extends StatefulWidget {
  CountingText({
    Key? key,
    @required this.begin,
    @required this.end,
    this.precision = 0,
    this.curve = Curves.linear,
    this.duration = const Duration(milliseconds: 250),
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
  }) : super(key: key);

  final double? begin;
  final double? end;
  final int? precision;
  final Curve? curve;
  final Duration? duration;

  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;

  @override
  _CountingTextState createState() => _CountingTextState();
}

class _CountingTextState extends State<CountingText> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller = AnimationController(duration: widget.duration, vsync: this);
    CurvedAnimation curvedAnimation = CurvedAnimation(parent: _controller!, curve: widget.curve!);
    _animation = Tween<double>(begin: widget.begin, end: widget.end).animate(curvedAnimation);
    _controller?.forward();

    return _McCountingAnimatedText(
      key: UniqueKey(),
      animation: _animation!,
      precision: widget.precision.validate(),
      style: widget.style!,
      textAlign: widget.textAlign,
      textDirection: widget.textDirection,
      locale: widget.locale,
      softWrap: widget.softWrap,
      overflow: widget.overflow,
      textScaleFactor: widget.textScaleFactor,
      maxLines: widget.maxLines,
      semanticsLabel: widget.semanticsLabel,
    );
  }
}

class _McCountingAnimatedText extends AnimatedWidget {
  _McCountingAnimatedText({
    Key? key,
    @required this.animation,
    @required this.precision,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
  }) : super(key: key, listenable: animation!);

  final Animation<double>? animation;
  final int? precision;

  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) => Text(
        this.animation!.value.toStringAsFixed(precision!),
        style: this.style,
        textAlign: this.textAlign,
        textDirection: this.textDirection,
        locale: this.locale,
        softWrap: this.softWrap,
        overflow: this.overflow,
        textScaleFactor: this.textScaleFactor,
        maxLines: this.maxLines,
        semanticsLabel: this.semanticsLabel,
      );
}
