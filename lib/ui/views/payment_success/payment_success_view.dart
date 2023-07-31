import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class PaymentSuccessView extends StatefulWidget {
  static const String routeName = "/payment-success";
  const PaymentSuccessView({Key? key}) : super(key: key);

  @override
  State<PaymentSuccessView> createState() => _PaymentSuccessViewState();
}

class _PaymentSuccessViewState extends State<PaymentSuccessView> {
  late ConfettiController controllerTopCenter;

  void initController() {
    controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      initController();
    });
    controllerTopCenter.play();
  }

  Align buildConfettiWidget(
      controller, double blastDirection, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: ConfettiWidget(
        maximumSize: const Size(30, 30),
        shouldLoop: false,
        confettiController: controller,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.directional,
        emissionFrequency: 0.01,
        numberOfParticles: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Congratulations"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 55,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Success!",
                  style: Theme.of(context).textTheme.headlineSmall,
                )
              ],
            ),
          ),
          buildConfettiWidget(controllerTopCenter, pi / 2, Alignment.topCenter),
          buildConfettiWidget(controllerTopCenter, pi / 4, Alignment.topLeft),
          buildConfettiWidget(
              controllerTopCenter, 3 * pi / 4, Alignment.topRight),
        ],
      ),
    );
  }
}
