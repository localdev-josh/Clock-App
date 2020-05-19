import 'dart:async';
import 'dart:math';

import 'clock_dial_painter.dart';
import 'clock_hands.dart';

import 'clock_text.dart';
import 'package:flutter/material.dart';
import 'clock_face.dart';

typedef TimeProducer = DateTime Function();

class Clock extends StatefulWidget {
  final Color circleColor;
  final Color shadowColor;

  final ClockText clockText;

  final TimeProducer getCurrentTime;
  final Duration updateDuration;

  Clock(
      {this.circleColor = Colors.red,
      this.shadowColor = Colors.green,
      this.clockText = ClockText.arabic,
      this.getCurrentTime = getSystemTime,
      this.updateDuration = const Duration(seconds: 1)});

  static DateTime getSystemTime() {
    return new DateTime.now();
  }

  @override
  State<StatefulWidget> createState() {
    return _Clock();
  }
}

class _Clock extends State<Clock> {
  Timer _timer;
  DateTime dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = new DateTime.now();
    this._timer = new Timer.periodic(widget.updateDuration, setTime);
  }

  void setTime(Timer timer) {
    setState(() {
      dateTime = new DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: 1.0,
      child: buildClockCircle(context),
    );
  }

  Container buildClockCircle(BuildContext context) {
    return new Container(
      width: double.infinity,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
          boxShadow: [
            BoxShadow(
                color: Color(0xffCDDAEE),
                offset: Offset(11, 8),
                blurRadius: 27),
            BoxShadow(
                color: Color(0xffF4F8FF),
                offset: Offset(-11, -8),
                blurRadius: 27)
          ]
      ),
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.transparent,
            child: new ClockFace(
              clockText: widget.clockText,
              dateTime: dateTime,
            ),
          ),
//          Container(
//            padding: EdgeInsets.all(25),
//            width: double.infinity,
//            color: Colors.red,
//            child: new CustomPaint(
//              painter: new ClockDialPainter(clockText: widget.clockText),
//            ),
//          ),
          new ClockHands(dateTime: dateTime),
        ],
      ),
    );
  }
}
