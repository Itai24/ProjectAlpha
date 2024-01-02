import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  //const SecondRoute({super.key});

  final int glowingNumber;
  SecondRoute(this.glowingNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text('Ultimate Rock Paper Scissors!'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondRoute()),);
                Navigator.pop(context);
              },
              child: const Text('never go back'),
            ),
            Text('your pick is $glowingNumber'),
          ],
        ),
      ),
    );
  }
}
