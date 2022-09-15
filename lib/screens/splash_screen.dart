import './price_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFFFC),
      body: Center(
        child: Lottie.asset('assets/lottie/bitcoin.json',
            width: 700,
            height: 700,
            controller: _animationController,
            animate: true, onLoaded: (composition) {
          _animationController
            ..duration = composition.duration
            ..forward().whenComplete(
                () => Navigator.of(context).pushReplacement(PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const PriceScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                      transitionDuration: const Duration(milliseconds: 300),
                    )));
        }),
      ),
    );
  }
}
