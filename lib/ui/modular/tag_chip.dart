import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final String text;
  final bool emphasize;

  const TagChip(
    this.text, {
    Key? key,
    this.emphasize = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: emphasize ? Colors.teal : Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
        color: emphasize ? Colors.teal : null,
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.fade,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: emphasize ? Colors.white : Colors.teal),
      ),
    );
  }
}
