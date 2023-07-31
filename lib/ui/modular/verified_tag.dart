import 'package:flutter/material.dart';

enum _VerifiedTagSize { small, large }

class VerifiedTag extends StatelessWidget {
  final _VerifiedTagSize _verifiedTagSize;

  const VerifiedTag.medium({
    Key? key,
  })  : _verifiedTagSize = _VerifiedTagSize.small,
        super(key: key);

  const VerifiedTag.large({
    Key? key,
  })  : _verifiedTagSize = _VerifiedTagSize.large,
        super(key: key);

  TextStyle? _getFontStyle(BuildContext context) {
    switch (_verifiedTagSize) {
      case _VerifiedTagSize.small:
        return Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
            );
      case _VerifiedTagSize.large:
        return Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Container(
              margin: const EdgeInsets.only(right: 4),
              child: Icon(
                Icons.verified,
                color: Colors.green,
                size: _verifiedTagSize == _VerifiedTagSize.small ? 12 : null,
              ),
            ),
          ),
          TextSpan(text: "Verified", style: _getFontStyle(context)),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.fade,
    );
  }
}
