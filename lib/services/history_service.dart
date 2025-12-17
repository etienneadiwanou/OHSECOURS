import 'package:flutter/material.dart';

class HistoryService {
  static final HistoryService _instance = HistoryService._internal();
  factory HistoryService() => _instance;
  HistoryService._internal();

  final List<Map<String, dynamic>> _history = [];

  List<Map<String, dynamic>> get history => _history;

  void addHistoryItem({
    required String type,
    required String description,
    required String location,
    String status = 'pending',
    BuildContext?
    context, // Optionnel si vous voulez formater l'heure avec le contexte
  }) {
    final now = DateTime.now();
    final timeString =
        context != null
            ? TimeOfDay.fromDateTime(now).format(context)
            : '${now.hour}:${now.minute.toString().padLeft(2, '0')}';

    _history.add({
      'type': type,
      'description': description,
      'location': location,
      'status': status,
      'date': now.toString().split(' ')[0], // Format YYYY-MM-DD
      'time': timeString,
      'icon': _getIconForType(type),
      'iconColor': _getColorForType(type),
    });
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case 'Accident':
        return Icons.car_crash;
      case 'Incendie':
        return Icons.local_fire_department;
      case 'Urgence':
        return Icons.medical_services;
      default:
        return Icons.warning;
    }
  }

  Color _getColorForType(String type) {
    switch (type) {
      case 'Accident':
        return Colors.red;
      case 'Incendie':
        return Colors.orange;
      case 'Urgence':
        return Colors.green;
      default:
        return Colors.blue;
    }
  }
}
