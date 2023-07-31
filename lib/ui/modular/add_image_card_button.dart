import 'package:flutter/material.dart';

class AddImageCardButton extends StatelessWidget {
  const AddImageCardButton({required this.onPresesd, Key? key})
      : super(key: key);

  final VoidCallback onPresesd;

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: onPresesd,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_a_photo, size: 32),
              const SizedBox(height: 16),
              Text("Add Images", style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
        ),
      ),
    );
  }
}
