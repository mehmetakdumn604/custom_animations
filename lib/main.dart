import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Animations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double width = double.maxFinite - 100;
  double height = 350;
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              duration: Duration(
                milliseconds: 400,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(pressed ? 0 : 12),
                ),
                color: Color.fromARGB(255, 121, 11, 239),
              ),
              height: pressed ? size.height : 300,
              width: pressed ? size.width : size.width - 100,
              child: FittedBox(
                child: Column(
                  children: getWidgets(size),
                ),
              ),
            ),
            Positioned(
              bottom: -10,
              left: 0,
              right: 0,
              child: IconButton(
                splashRadius: 15,
                onPressed: () {
                  setState(() {
                    if (!pressed) {
                      pressed = true;
                    } else {
                      pressed = false;
                    }
                  });
                },
                iconSize: 36,
                icon: Icon(pressed
                    ? Icons.arrow_drop_up_sharp
                    : Icons.arrow_drop_down_sharp),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getWidgets(Size size) {
    if (pressed) {
      return [
        Center(
          child: Lottie.network(
            "https://assets5.lottiefiles.com/packages/lf20_T1SlYO.json",
            repeat: true,
            reverse: false,
            fit: BoxFit.cover,
            height: 250,
            animate: pressed,
          ),
        ),
        FittedBox(
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 30.0,
            ),
            child: AnimatedTextKit(
              isRepeatingAnimation: false,
              animatedTexts: [
                TyperAnimatedText(
                  'THANK YOU FOR WATCHING',
                ),
                TyperAnimatedText('Did you like this video?'),
                TyperAnimatedText('If your answer is yes'),
                TyperAnimatedText(
                  ' Like 👍 comment 📝 and subscribe to\n my channel for more such content.',
                ),
              ],
              onTap: () {},
            ),
          ),
        ),
      ];
    }
    return [
      Center(
        child: Lottie.network(
            "https://assets1.lottiefiles.com/private_files/lf30_vah1eb8r.json",
            repeat: true,
            reverse: false,
            fit: BoxFit.cover,
            options: LottieOptions(enableMergePaths: true)),
      ),
    ];
  }
}
