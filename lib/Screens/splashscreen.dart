import 'package:bookstore/Screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
        title: "Spare ",
        body: " by Prince Harry, The Duke of Sussex",
        footer: ElevatedButton(onPressed: () {}, child: const Text("Lets go")),
        image: Center(
          child: Image.asset("assets/images/spare.jpg"),
        ),
        decoration: const PageDecoration(
          titleTextStyle:
              TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        )),
    PageViewModel(
        title: "50 Shades ",
        body: "(Fifty Shades Trilogy #1)",
        footer: ElevatedButton(
          onPressed: () {},
          child: const Text("Lets go"),
        ),
        image: Center(
          child: Image.asset("assets/images/50shades.png"),
          heightFactor: 100,
          widthFactor: 100,
        ),
        decoration: const PageDecoration(
          titleTextStyle:
              TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        )),
    PageViewModel(
        title: "The Last Thing He Told Me",
        body: "by Laura Dave",
        footer: ElevatedButton(
          onPressed: () {},
          child: const Text("Lets go"),
        ),
        image: Center(
          child: Image.asset("assets/images/book0.jpg"),
        ),
        decoration: const PageDecoration(
          titleTextStyle:
              TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: Color.fromARGB(255, 229, 139, 245),
            activeSize: Size.square(15),
          ),
          showDoneButton: true,
          done: const Text(
            'done',
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 25,
          ),
          onDone: (() => onDone(context)),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
