import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/providers/current_user_location_provider.dart';

class LocationWidget extends ConsumerWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(currentLocationProvider);
    return TextButton.icon(
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
      ),
      onPressed: () {},
      icon: location.locationLoading
          ? const CircularProgressIndicator()
          : const Icon(Icons.location_on_outlined),
      label: Text(
        location.currentAddress,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
