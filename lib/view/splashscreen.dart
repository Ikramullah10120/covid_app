import 'dart:async';

import 'package:covid_app/view/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math; // Importing math library for mathematical functions

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // TickerProviderStateMixin is used for animation
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 3), // Animation duration of 3 seconds
    vsync: this, // Vsync is used to optimize the animation performance
  )..repeat(); // Repeats the animation indefinitely

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WorldStates()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // the UI is displayed within the safe area of the screen
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller, // Uses the animation controller
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: child,
                  );
                },
                child: Container(
                  height: 150,
                  width: 150,
                  child: Center(
                    child: Image(
                      image: AssetImage('assets/images/virus.jpg'),
                    ), // Displays the image
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .08),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Covid -19\nTracker App',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
