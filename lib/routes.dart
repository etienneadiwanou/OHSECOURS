import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/emergency_screen.dart';
import 'screens/incident_type_screen.dart';
import 'screens/fire_report_screen.dart';
import 'screens/accident_report_screen.dart';
import 'screens/history_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/fire_history_screen.dart';
import 'screens/medical_history_screen.dart';
import 'screens/medical_report_screen.dart';

// Noms de routes
const String welcomeRoute = '/welcome';
const String emergencyRoute = '/emergency';
const String incidentTypeRoute = '/incident-type';
const String fireReportRoute = '/fire-report';
const String accidentReportRoute = '/accident-report';
const String historyRoute = '/history';
const String notificationRoute = '/notification';
const String settingsRoute = '/settings';
const String fireHistoryRoute = '/fire-history';
const String accidentHistoryRoute = '/accident-history';
const String medicalHistoryRoute = '/medical-history';
const String medicalReportRoute = '/medical-report';

// Map des routes
final Map<String, WidgetBuilder> appRoutes = {
  welcomeRoute: (context) => const WelcomeScreen(),
  emergencyRoute: (context) => const EmergencyScreen(),
  incidentTypeRoute: (context) => const IncidentTypeScreen(),
  fireReportRoute: (context) => const FireReportScreen(),
  accidentReportRoute: (context) => const AccidentReportScreen(),
  historyRoute: (context) => const HistoryScreen(),
  notificationRoute: (context) => const NotificationScreen(),
  settingsRoute: (context) => const SettingsScreen(),
  fireHistoryRoute: (context) => const FireHistoryScreen(),
  medicalHistoryRoute: (context) => const MedicalHistoryScreen(),
  medicalReportRoute: (context) => const MedicalReportScreen(),
};
