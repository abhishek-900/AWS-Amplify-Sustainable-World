import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart' hide Path;
// ignore: depend_on_referenced_packages
import 'package:proj4dart/proj4dart.dart' as proj4;
import 'package:sustainable_world/providers/current_user_location_provider.dart';

class MapView extends ConsumerStatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  ConsumerState<MapView> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView> {
  late proj4.Point point;

  @override
  void initState() {
    super.initState();
    point = proj4.Point(
        x: ref.read(currentLocationProvider).position!.latitude,
        y: ref.read(currentLocationProvider).position!.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom CRS')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(point.x, point.y),
                  onTap: (tapPosition, p) => setState(() {
                    point = proj4.Point(x: p.latitude, y: p.longitude);
                  }),
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
            ),
          ],
        ),
      ),
    );
  }
}

class DrawTriangleShape extends CustomPainter {
  late Paint painter;

  DrawTriangleShape() {
    painter = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width / 3, size.height / 2);
    path.lineTo(size.height / 3, 0);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
