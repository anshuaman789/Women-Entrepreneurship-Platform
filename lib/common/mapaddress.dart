import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Location {
  final LatLng coordinates;
  final String name;
  final String description;
  final String address;

  Location({
    required this.coordinates,
    required this.name,
    required this.description,
    required this.address,
  });
}

class MapAddress extends StatefulWidget {
  @override
  _MapAddressState createState() => _MapAddressState();
}

class _MapAddressState extends State<MapAddress> {
  final List<Location> locations = [
    Location(
      coordinates:  LatLng(28.62209, 77.21227),
      name: 'Niti Aayog',
      description: 'Women Entrepreneurship Platform,',
      address: 'Sansad Marg, Sansad Marg Area, \nNew Delhi - 110001, India',
    ),
  ];

  MapController mapController = MapController();
  double minZoom = 1.0;
  double maxZoom = 18.0;
  double currentZoom = 16.0;
  Location? selectedLocation;

  void zoomIn() {
    double newZoom = currentZoom + 1.0;
    if (newZoom <= maxZoom) {
      mapController.move(mapController.center, newZoom);
      setState(() {
        currentZoom = newZoom;
      });
    }
  }

  void zoomOut() {
    double newZoom = currentZoom - 1.0;
    if (newZoom >= minZoom) {
      mapController.move(mapController.center, newZoom);
      setState(() {
        currentZoom = newZoom;
      });
    }
  }

  void selectLocation(Location? location) {
    setState(() {
      selectedLocation = location;
    });
  }

  void dismissCard() {
    setState(() {
      selectedLocation = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: SingleChildScrollView(
      child: Column(
        children: <Widget> [
          SizedBox(height:10),
          Padding(padding: EdgeInsets.only(top:1, bottom: 10),
            child: Text('Click Pin to View Address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),),
          ),

          Container(
        height: 735,
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                center:  LatLng(28.62209, 77.21227),
                zoom: currentZoom,
                minZoom: minZoom,
                maxZoom: maxZoom,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: locations
                      .map(
                        (Location location) => Marker(
                      point: location.coordinates,
                      builder: (ctx) => GestureDetector(
                        onTap: () => selectLocation(location),
                        child: MarkerWidget(
                          isSelected: location == selectedLocation,
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ],
              mapController: mapController,
            ),
            if (selectedLocation != null)
              GestureDetector(
                onTap: dismissCard,
                child: Container(
                  color: Colors.transparent,
                  constraints: BoxConstraints.expand(),
                ),
              ),
            if (selectedLocation != null)
              Positioned(
                top: 16.0,
                left: 16.0,
                right: 16.0,
                child: LocationCard(location: selectedLocation!),
              ),
          ],
        ),),],),),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Opacity(
            opacity: currentZoom >= maxZoom ? 0.5 : 1.0,
            child: FloatingActionButton(
              heroTag: 'ZoomIn',
              onPressed: currentZoom >= maxZoom ? null : zoomIn,
              child: Icon(Icons.add),
              elevation: currentZoom >= maxZoom ? 0.0 : 6.0,
            ),
          ),
          SizedBox(height: 8.0),
          Opacity(
            opacity: currentZoom <= minZoom ? 0.5 : 1.0,
            child: FloatingActionButton(
              heroTag: 'ZoomOut',
              onPressed: currentZoom <= minZoom ? null : zoomOut,
              child: Icon(Icons.remove),
              elevation: currentZoom <= minZoom ? 0.0 : 6.0,
            ),
          ),
        ],
      ),
    );
  }
}

class MarkerWidget extends StatelessWidget {
  final bool isSelected;

  MarkerWidget({this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.place,
      color: isSelected ? Colors.red : Colors.blue,
      size: 40,
    );
  }
}

class LocationCard extends StatelessWidget {
  final Location location;

  LocationCard({required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'Map',
            child: Image.asset(
              'assets/images/niti-loc.png', // Replace with your own image asset
              width: double.infinity,
              height: 100.0,
              fit: BoxFit.cover,
            ),),
            SizedBox(height: 16.0),
            Hero(
              tag: 'Niti-AAyog',
            child: Text(
              location.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),),
            SizedBox(height: 8.0),
            Hero(
              tag: 'Address',
              child: Text(
              location.description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),),
            SizedBox(height: 8.0),
            Hero(
            tag: 'Address',
            child:   Text(
              location.address,
              style: TextStyle(
                fontSize: 16,
              ),
            ),),
          ],
        ),
      ),
    );
  }
}
