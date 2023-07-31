import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:sustainable_world/providers/current_user_location_provider.dart';
import 'package:sustainable_world/ui/views/dispose_form/contribution_to/contribution_to_view.dart';
import 'package:sustainable_world/ui/views/dispose_form/dispose_form_provider.dart';

class PostLocationView extends ConsumerWidget {
  const PostLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var disposeForm = ref.watch(disposeFormProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Location"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.my_location),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          FlutterMap(
            options: MapOptions(
              center: const LatLng(8.7642, 78.1348),
              zoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 80,
                    height: 80,
                    point: const LatLng(8.7642, 78.1348),
                    builder: (context) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                                width: 4,
                              ),
                              color: Colors.blue.withOpacity(0.35),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Center(
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              )
            ],
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: ElevatedButton.icon(
              onPressed: () {
                disposeForm.setData((oldData) => {
                      ...oldData,
                      'productLocation':
                          ref.watch(currentLocationProvider).currentAddress
                    });
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ContributionToView(),
                  ),
                );
              },
              icon: const Icon(Icons.location_on),
              label: const Text("Select Location"),
            ),
          ),
        ],
      ),
    );
  }
}
