import 'package:flutter/material.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Center(
        child: Text("No Image"),
      ),
    );
  }
}
