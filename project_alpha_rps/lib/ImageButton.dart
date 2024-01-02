import 'package:flutter/material.dart';

class GlowingImageButton extends StatefulWidget {
  final String imagePath;
  final Function(String) onPressed;
  final bool glown;

  GlowingImageButton(
      {required this.imagePath, required this.onPressed, required this.glown});

  @override
  _GlowingImageButton createState() => _GlowingImageButton();
}

class _GlowingImageButton extends State<GlowingImageButton> {
  //int _counter = 0;
  //bool isGlowing = false;

  void toggleGlowing() {
    setState(() {
      //isGlowing = !isGlowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            String elenevthLetter = widget.imagePath[
                26]; //taking the letter p / r or s. to know wich image button is clicked
            //print(elenevthLetter);
            widget.onPressed(elenevthLetter);

            /*setState(() {
              //_counter++;
              toggleGlowing();
            });*/
          },
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              //boxShadow: isGlowing
              boxShadow: widget.glown //if the widget shuold be glow so glow
                  ? [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 0),
                      ),
                    ]
                  : [], //else do nothing
            ),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(10.0), //define the image radios
              child: Image.asset(
                widget.imagePath,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
        /*SizedBox(height: 10),
        Text(
          'Counter: $_counter',
          style: TextStyle(fontSize: 16),
        ),*/
      ],
    );
  }
}
