import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'routes.dart';
import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 📍 Demande de permission localisation
  await Geolocator.requestPermission();

  runApp(const EmergencyApp());
}

class EmergencyApp extends StatelessWidget {
  const EmergencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application d\'Urgence',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: const Color(0xFFD32F2F),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFD32F2F),
          foregroundColor: Colors.white,
        ),
      ),
      home: const WelcomeScreen(),
      routes: appRoutes,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder:
              (context) => Scaffold(
                appBar: AppBar(title: const Text('Page non trouvée')),
                body: Center(child: Text('Route ${settings.name} non trouvée')),
              ),
        );
      },
    );
  }
}
