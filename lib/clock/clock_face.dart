import 'clock_text.dart';
import 'package:flutter/material.dart';
import 'clock_dial_painter.dart';
import 'clock_hands.dart';

class ClockFace extends StatelessWidget{

  final DateTime dateTime;
  final ClockText clockText;
  ClockFace({this.clockText = ClockText.arabic, this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Center(
          child: new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new AspectRatio(
          aspectRatio: 0.75,
          child: new Container(
            width: double.infinity,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xfff4f9fd),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffDEE2ED).withOpacity(0.7),
                      offset: Offset(12, 3),
                      blurRadius: 27),
                  BoxShadow(
                      color: Color(0xfff4f9fd),
                      offset: Offset(-13, -10),
                      blurRadius: 10)
                ]
//              boxShadow: [
////                DBE6F3
//
//                BoxShadow(
//                  offset: Offset(8.0, 0),
//                  blurRadius: 13,
//                  spreadRadius: 1,
//                  color: Color(0xffd3e0f0)
//                )
//              ]
            ),
          ),

        ),
      ),
    );
  }
}


