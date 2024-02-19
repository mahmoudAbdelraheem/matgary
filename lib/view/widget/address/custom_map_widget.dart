import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:matgary/core/constant/app_colors.dart';

class CustomMapWidget extends StatelessWidget {
  final LatLng currentLocation;
  final void Function(TapPosition, LatLng)? onMapTap;
  const CustomMapWidget({
    super.key,
    required this.currentLocation,
    required this.onMapTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            initialCenter: currentLocation,
            initialZoom: 16.0,
            onTap: onMapTap,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: currentLocation,
                  child: Icon(
                    Icons.location_on,
                    color: AppColors.myRed,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
