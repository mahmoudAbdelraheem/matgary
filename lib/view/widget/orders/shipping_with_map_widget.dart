import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/data/models/orders/order_model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ShippingWithMapWidget extends StatelessWidget {
  final OrdersModel model;

  const ShippingWithMapWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Shipping Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: AppColors.myBlack,
                ),
              ),
              subtitle: Text(
                '${model.addressName} : ${model.addressCity} -  ${model.addressStreet}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.myBlack,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 300,
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: [
                  FlutterMap(
                    options: MapOptions(
                      initialCenter: LatLng(
                        double.parse(model.addressLat!),
                        double.parse(model.addressLong!),
                      ),
                      initialZoom: 14.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: LatLng(
                              double.parse(model.addressLat!),
                              double.parse(model.addressLong!),
                            ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
