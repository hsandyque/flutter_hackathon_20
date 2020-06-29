import 'dart:io';
import 'package:flutter/material.dart';

class SingleFlickerText extends StatefulWidget {
  final Color color;

  const SingleFlickerText({Key key, this.color}) : super(key: key);
  @override
  _SingleFlickerTextState createState() => _SingleFlickerTextState();
}

class _SingleFlickerTextState extends State<SingleFlickerText>
    with TickerProviderStateMixin {
  AnimationController animation;
  Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _fadeInFadeOut = Tween<double>(begin: 1.0, end: 0.2).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        sleep(Duration(milliseconds: 200));
        animation.forward();
      }
    });
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle strokeStyle = TextStyle(
      letterSpacing: 5,
      fontSize: 100,
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = widget.color,
      fontFamily: "ArcadeMachine",
    );
    TextStyle glowStyle = TextStyle(
      letterSpacing: 5,
      fontFamily: "ArcadeMachine",
      fontSize: 100,
      shadows: [
        BoxShadow(
          color: widget.color,
          blurRadius: 1.0,
          spreadRadius: 1.0,
        ),
        BoxShadow(
          color: widget.color,
          blurRadius: 30.0,
          spreadRadius: 30.0,
        ),
        BoxShadow(
          color: widget.color,
          blurRadius: 30.0,
          spreadRadius: 2.0,
        ),
        BoxShadow(
          color: widget.color,
          blurRadius: 200.0,
          spreadRadius: 200.0,
        ),
      ],
      color: Colors.white,
    );
    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text("Mission Hunter",
              textAlign: TextAlign.center, style: strokeStyle),
          Text("Mission Hunter", textAlign: TextAlign.center, style: glowStyle),
        ],
      ),
    );
  }
}
