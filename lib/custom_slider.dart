import 'dart:ui';

import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';

void main() {
  runApp(const MaterialApp(
    home: CustomSlider(),
    debugShowCheckedModeBanner: false,
  ));
}

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;

  final double? height;

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int _value = 0;

  bool isConditionMet = false;

  static double _sliderValue = 300;

  static double _recommendedValue = 300;

  static double _downArrowValue = 0;

  static int _downArrowPadding = 0;

  static Color _activeTrackColor = Colors.blue;

  static double minValue = 1;

  static double maxValue = 500;

  double centerValue = 0;

  @override
  void initState() {
    _updateActiveTrackColor();

    _updateDownArrowPosition();

    centerValue = ((maxValue - minValue) / 2) + 1;

    if (minValue == _recommendedValue || maxValue == _recommendedValue) {
      _downArrowPadding = 80;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: widget.height,
          width: widget.width,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Align(
                    //alignment: Alignment.bottomLeft,
                    child: Padding(
                      // padding: EdgeInsets.only(

                      //     left: ((width) * (_sliderValue / 3.6)) > 124

                      //         ? ((width) * (_sliderValue / 3.6))-124

                      //         : ((width) * (_sliderValue / 3.6))),

                      padding: EdgeInsets.only(
                          right: (centerValue - _recommendedValue) * 10 > 0
                              ? ((60 / (maxValue - minValue)) *
                                  ((centerValue - _recommendedValue) * 10 -
                                      _downArrowPadding))
                              : 0,
                          left: (_recommendedValue - centerValue) * 10 > 0
                              ? ((60 / (maxValue - minValue)) *
                                      ((_recommendedValue - centerValue) * 10) -
                                  _downArrowPadding)
                              : 0),

                      child: Container(
                        width: 124,
                        decoration: ShapeDecoration(
                          color: const Color.fromRGBO(31, 135, 76, 1),
                          shape: ToolTipCustomShape(downArrow: _downArrowValue),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 4, top: 8, right: 4, bottom: 8),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text("Recommended",
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                        letterSpacing: 0.1)),
                                SizedBox(
                                  width: 20,
                                  child: GestureDetector(
                                    child: const Icon(
                                      Icons.info,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),


                SfSliderTheme(
                  data: SfSliderThemeData(
                    thumbRadius: 13,
                    thumbColor: Colors.white,
                    thumbStrokeWidth: 3,
                    thumbStrokeColor: _activeTrackColor,
                    activeTrackColor: _activeTrackColor,
                    activeTrackHeight: 4,
                    inactiveTrackHeight: 4,
                    activeDividerRadius: 1.5,
                    inactiveDividerRadius: 1.5,
                  ),
                  child: SfSlider(
                    value: _sliderValue,

                    min: minValue,

                    max: maxValue,

                    interval: 100,

                    // showTicks: true,

                    showLabels: true,

                    enableTooltip: false,

                    // minorTicksPerInterval: 1,

                    onChanged: (newValue) {
                      setState(() {
                        _sliderValue = newValue;

                        _updateActiveTrackColor();

                        _updateDownArrowPosition(); // Update active track color dynamically
                      });
                    },
                  ),
                ),

                // Text('Slider Value: $_sliderValue'),
              ],
            ),
          ),
        ));
  }

  static void _updateActiveTrackColor() {
    // Adjust the color based on your logic and the slider value

    if (_sliderValue < 150) {
      _activeTrackColor = const Color.fromRGBO(247, 165, 0, 1);
    } else if (_sliderValue < 300) {
      _activeTrackColor = const Color.fromRGBO(31, 135, 76, 1);
    } else {
      _activeTrackColor = const Color.fromRGBO(3, 76, 34, 1);
    }
  }

  static double _updateDownArrowPosition() {
    if (_recommendedValue == minValue) {
      return _downArrowValue = 48;
    } else if (_recommendedValue == maxValue) {
      return _downArrowValue = (-38);
    }

    return _downArrowValue = 6.5;
  }
}

class ToolTipCustomShape extends ShapeBorder {
  final bool usePadding;

  final double downArrow;

  ToolTipCustomShape({this.usePadding = true, required this.downArrow});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: usePadding ? 20 : 0);

  @override
  Path getInnerPath(Rect rect, {dynamic textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {dynamic textDirection}) {
    rect =
        Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 20));

    return Path()
      ..addRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 10)))
      ..moveTo(rect.bottomCenter.dx - (downArrow), rect.bottomCenter.dy)
      ..relativeLineTo(5, 8)
      ..relativeLineTo(5, -8)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {dynamic textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
