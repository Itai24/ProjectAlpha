import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:project_alpha_rps/ImageButton.dart';
import 'package:project_alpha_rps/threeButtons.dart';
import 'package:project_alpha_rps/secondPage.dart';

void main() {
  runApp(const MyApp());
}

/////////////////////////////////////////////////////// control z until this line disapears
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Define your custom color scheme
    const ColorScheme myColorScheme = ColorScheme(
      primary: Color(0xFF7D0A0A),
      //primaryVariant: Color(0xFF57494C),
      secondary: Color(0xFFBF3131),
      //secondaryVariant: Color(0xFF1B4F72),
      surface: Color(0xFFF3EDC8),
      background: Color(0xFFEAD196),
      error: Colors.red,
      onPrimary: Color(0xFF8d99ae),
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.red,
      onError: Colors.white,
      brightness: Brightness.light,
    );

    // Create a ThemeData with the custom color scheme
    ThemeData myTheme = ThemeData.from(colorScheme: myColorScheme);

    return MaterialApp(
        title: 'R - P - S',
        theme: myTheme,
        /*theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          //primaryColor: primaryColorToApp,

          //colorScheme: ColorScheme.fromSeed(seedColor: primaryColorToApp),

          //color: Theme.of(context).colorScheme.primary
          //useMaterial3: true,
          ),*/
        home: const MyHomePage(title: 'Ultimate Rock Paper Scissors!'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counterRock = 0;
  List<bool> glowState = [false, false, false];

  void startGame(clicked) {
    print('you clicked on $clicked!');
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.secondary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to ULTIMATE Rock Paper Scissors!',
              style: TextStyle(
                  /*shadows: [
                    Shadow(
                        blurRadius: 2.0,
                        color: const Color.fromARGB(255, 199, 25, 25),
                        offset: Offset(2.0, 2.0))
                  ],*/
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  //color: Color.fromARGB(255, 58, 186, 19),
                  color: Theme.of(context).colorScheme.primary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35),
            Text(
              'Please choose your player and hit start!',
              style: TextStyle(
                shadows: [
                  Shadow(
                      blurRadius: 0.5,
                      color: Colors.grey,
                      offset: Offset(1.0, 1.0))
                ],
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GlowingImageButton(
                    imagePath: 'assets/images/game-icons/1rock.png',
                    onPressed: (index) {
                      updateGlowingButton(index);
                    },
                    glown: glowState[0]),
                GlowingImageButton(
                    imagePath: 'assets/images/game-icons/1paper.png',
                    onPressed: (index) {
                      updateGlowingButton(index);
                    },
                    glown: glowState[1]),
                GlowingImageButton(
                    imagePath: 'assets/images/game-icons/1scissors.png',
                    onPressed: (index) {
                      //print('function activate!');
                      updateGlowingButton(index);
                    },
                    glown: glowState[2]),

                /*ThreeButtons(
                    imagePath1: 'assets/images/game-icons/1rock.png',
                    imagePath2: 'assets/images/game-icons/1paper.png',
                    imagePath3: 'assets/images/game-icons/1scissors.png')*/
                //creating new threeButton widget

                /*CounterImageButton(
                      imagePath: 'assets/images/game-icons/1rock.png',
                    ),
                    CounterImageButton(
                      imagePath: 'assets/images/game-icons/1paper.png',
                    ),
                    CounterImageButton(
                      imagePath: 'assets/images/game-icons/1scissors.png',
                    )*/
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                //onPressed: startGame,
                onPressed: () {
                  int glowingIndex = glowState.indexOf(
                      true); //taking the match boolean list cell for the image button
                  //print(glowingIndex);
                  startGame(glowingIndex);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondRoute(glowingIndex),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.background),
                child: Text(
                  'Start!',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary),
                )),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void updateGlowingButton(String selectedIndex) {
    //print(selectedIndex);
    //update the list for the one image button that glow right now
    setState(() {
      if (selectedIndex == 'r') {
        glowState[0] = true;
        glowState[1] = false;
        glowState[2] = false;
      } else if (selectedIndex == 'p') {
        glowState[0] = false;
        glowState[1] = true;
        glowState[2] = false;
      } else {
        glowState[0] = false;
        glowState[1] = false;
        glowState[2] = true;
      }
      //print(glowState);
    });
  }
}
