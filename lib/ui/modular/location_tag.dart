import 'package:flutter/material.dart';

enum _LocationTagSize { small, medium }

class LocationTag extends StatelessWidget {
  final String label;
  final _LocationTagSize _locationTagSize;

  const LocationTag.small(this.label, {Key? key})
      : _locationTagSize = _LocationTagSize.small,
        super(key: key);

  const LocationTag.medium(this.label, {Key? key})
      : _locationTagSize = _LocationTagSize.medium,
        super(key: key);

  TextStyle? _getFontStyle(BuildContext context) {
    switch (_locationTagSize) {
      case _LocationTagSize.small:
        return Theme.of(context).textTheme.bodySmall;
      case _LocationTagSize.medium:
        return Theme.of(context).textTheme.bodyMedium;
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
                Icons.location_on_outlined,
                color: Theme.of(context).textTheme.bodySmall!.color,
                size: _locationTagSize == _LocationTagSize.small ? 12 : null,
              ),
            ),
          ),
          TextSpan(text: label, style: _getFontStyle(context)),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.fade,
    );
  }
}
