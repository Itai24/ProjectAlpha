import 'package:flutter/material.dart';

class ThreeButtons extends StatefulWidget {
  final String imagePath1;
  final String imagePath2;
  final String imagePath3;

  ThreeButtons(
      {required this.imagePath1,
      required this.imagePath2,
      required this.imagePath3});

  @override
  _ThreeButtonsState createState() => _ThreeButtonsState();
}

class _ThreeButtonsState extends State<ThreeButtons> {
  int glowingNow = 0;

  void toggleGlowing(int index) {
    setState(() {
      glowingNow = index;
    });
  }

  int getWhoGlowingNow() {
    return glowingNow;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              //_counter++;
              toggleGlowing(1);
            });
          },
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: glowingNow == 1
                  ? [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 0),
                      ),
                    ]
                  : [],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                widget.imagePath1,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              //_counter++;
              toggleGlowing(2);
            });
          },
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: glowingNow == 2
                  ? [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 0),
                      ),
                    ]
                  : [],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                widget.imagePath2,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              //_counter++;
              toggleGlowing(3);
            });
          },
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: glowingNow == 3
                  ? [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 0),
                      ),
                    ]
                  : [],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                widget.imagePath3,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
