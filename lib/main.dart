import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const OrderTrackingPage(),
    );
  }
}

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  _OrderTrackingPageState createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {
  int _selectedIndex = 0;

  final List<TitledPage> _pages = [
    OrderTrackingContent(title: 'Navigation & Location Tracking'), // Map Page
    UploadImagesPage(title: 'Upload Images'),     // Upload Images Page
    VoiceCommandsPage(title: 'Voice Commands'),    // Voice Commands Page
    EmergencyContactsPage(title: 'Emergency Contacts'), // Emergency Contacts Page
    SettingsPage(title: 'Settings'),         // Settings Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex].title),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.map, size: 28, color: _selectedIndex == 0 ? Colors.blue : Colors.grey),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.image, size: 28, color: _selectedIndex == 1 ? Colors.blue : Colors.grey),
              onPressed: () => _onItemTapped(1),
            ),
            IconButton(
              icon: Icon(Icons.mic, size: 60, color: _selectedIndex == 2 ? Colors.blue : Colors.grey), // Increased size of voice icon
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(Icons.contacts, size: 28, color: _selectedIndex == 3 ? Colors.blue : Colors.grey),
              onPressed: () => _onItemTapped(3),
            ),
            IconButton(
              icon: Icon(Icons.settings, size: 28, color: _selectedIndex == 4 ? Colors.blue : Colors.grey),
              onPressed: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

abstract class TitledPage extends StatelessWidget {
  final String title;

  const TitledPage({Key? key, required this.title}) : super(key: key);
}

class OrderTrackingContent extends TitledPage {
  const OrderTrackingContent({Key? key, required String title})
      : super(key: key, title: title);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(37.422, -122.084),
        zoom: 15,
      ),
      markers: {
        Marker(
          markerId: const MarkerId("marker_1"),
          position: const LatLng(37.422, -122.084),
          infoWindow: const InfoWindow(
            title: "Marker Title",
            snippet: "Marker Snippet",
          ),
        ),
      },
    );
  }
}

class UploadImagesPage extends TitledPage {
  const UploadImagesPage({Key? key, required String title})
      : super(key: key, title: title);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

class VoiceCommandsPage extends TitledPage {
  const VoiceCommandsPage({Key? key, required String title})
      : super(key: key, title: title);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

class EmergencyContactsPage extends TitledPage {
  const EmergencyContactsPage({Key? key, required String title})
      : super(key: key, title: title);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

class SettingsPage extends TitledPage {
  const SettingsPage({Key? key, required String title})
      : super(key: key, title: title);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
