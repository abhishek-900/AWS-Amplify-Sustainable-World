import 'package:flutter/material.dart';

class FixedBottomButtonBar extends StatelessWidget {
  const FixedBottomButtonBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      padding: const EdgeInsets.all(8),
      child: child,
    );
  }
}
