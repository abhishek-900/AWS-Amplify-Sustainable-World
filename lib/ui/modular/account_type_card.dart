import 'dart:ui';

import 'package:flutter/material.dart';

class AccountTypeCard extends StatelessWidget {
  const AccountTypeCard({
    required this.image,
    required this.selected,
    required this.labelText,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final ImageProvider<Object> image;
  final bool selected;
  final String labelText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: selected ? 1.0 : 0.5,
              child: Image(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                  child: Container(
                    color: Colors.black54,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            labelText,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (selected)
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
