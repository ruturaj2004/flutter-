import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late double _zoomLevel;
  late Location _location;

  @override
  void initState() {
    super.initState();
    _zoomLevel = 10;
    _location = Location();
  }

  Future<LocationData?> _getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    return await _location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    var latString = GetStorage().read('latitude');
    var lonString = GetStorage().read('longitude');

    var lat = double.parse(latString);
    var lon = double.parse(lonString);
    print("latitude of map $lat");
    print("longitude of map $lon");
    return FutureBuilder<LocationData?>(
      future: _getCurrentLocation(),
      builder: (BuildContext context, AsyncSnapshot<LocationData?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          _getCurrentLocation();
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Expanded(
                  child: InteractiveViewer(
                    child: SfMaps(
                      layers: [
                        MapTileLayer(
                          initialFocalLatLng: MapLatLng(
                            lat,
                            lon,
                          ),
                          initialZoomLevel: _zoomLevel.toInt(),
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          markerBuilder: (BuildContext context, int index) {
                            return MapMarker(
                              latitude: lat,
                              longitude: lon,
                              size: Size(20.w, 20.h),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.red[800],
                              ),
                            );
                          },
                          zoomPanBehavior: MapZoomPanBehavior(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Center(child: Text('Unable to fetch location'));
        }
      },
    );
  }
}
