import 'package:flutter/material.dart';

class AppNavigationBarItem extends StatelessWidget {
  const AppNavigationBarItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.onTap,
    this.active = false,
    Key? key,
  }) : super(key: key);

  final bool active;
  final Icon icon;
  final Icon activeIcon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          active ? activeIcon : icon,
          const SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }
}
