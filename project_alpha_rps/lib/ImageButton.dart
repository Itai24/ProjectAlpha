import 'package:flutter/material.dart';

class CounterImageButton extends StatefulWidget {
  final String imagePath;

  CounterImageButton({required this.imagePath});

  @override
  _CounterImageButtonState createState() => _CounterImageButtonState();
}

class _CounterImageButtonState extends State<CounterImageButton> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _counter++;
            });
          },
          child: Image.asset(
            widget.imagePath,
            width: 100,
            height: 100,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Counter: $_counter',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
