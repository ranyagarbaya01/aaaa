import 'package:blink_list/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:blink_list/intro_screens/intro_page_1.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: [IntroPage1(), SignInPage()],
        onPageChangeCallback: (page) {
          setState(() {
            currentPage = page;
          });
        },
        waveType: WaveType.liquidReveal,
        slideIconWidget: const Icon(Icons.arrow_back_ios), // Add a back icon
        enableLoop:
            false, // Disable loop for preventing going to the previous page
      ),
    );
  }
}
