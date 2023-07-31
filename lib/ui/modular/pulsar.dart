import 'package:flutter/material.dart';

class Pulsar extends StatefulWidget {
  const Pulsar({
    required this.child,
    this.animationCurve = Curves.easeInOut,
    this.lowOpacity = 0.5,
    this.highOpacity = 1,
    this.pulsePeriod = const Duration(milliseconds: 800),
    Key? key,
  })  : assert(lowOpacity <= highOpacity &&
            lowOpacity >= 0.0 &&
            lowOpacity <= 1.0 &&
            highOpacity >= 0.0 &&
            highOpacity <= 1.0),
        super(key: key);

  final Widget child;
  final double lowOpacity;
  final double highOpacity;
  final Duration pulsePeriod;
  final Curve animationCurve;

  @override
  State<Pulsar> createState() => _PulsarState();
}

class _PulsarState extends State<Pulsar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    initAndStartAnimation();
  }

  @override
  void didUpdateWidget(covariant Pulsar oldWidget) {
    super.didUpdateWidget(oldWidget);
    initAndStartAnimation();
  }

  void initAndStartAnimation() {
    _controller.stop(canceled: true);
    _opacityAnimation =
        Tween<double>(begin: widget.lowOpacity, end: widget.highOpacity)
            .animate(
      CurvedAnimation(parent: _controller, curve: widget.animationCurve),
    );
    _controller
        .repeat(
          reverse: true,
          period: widget.pulsePeriod,
        )
        .orCancel
        .catchError((_) {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => Opacity(
        opacity: _opacityAnimation.value,
        child: widget.child,
      ),
    );
  }
}
