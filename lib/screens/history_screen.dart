import 'package:flutter/material.dart';
import '../services/history_service.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String activeFilter = 'Tous';
  final List<String> filters = ['Tous', 'Accident', 'Incendie', 'Urgence'];

  List<Map<String, dynamic>> getFilteredIncidents() {
    if (activeFilter == 'Tous') {
      return HistoryService().history;
    } else {
      return HistoryService().history
          .where((incident) => incident['type'] == activeFilter)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredIncidents = getFilteredIncidents();

    return Scaffold(
      body: Column(
        children: [
          // En-tête rouge avec bouton retour et titre
          Container(
            color: const Color(0xFFD32F2F),
            padding: const EdgeInsets.only(
              top: 50,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white),
                    ),
                    child: const Center(
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: Text(
                    'HISTORIQUES',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          // Barre de filtres
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    filters.map((filter) {
                      final isActive = activeFilter == filter;
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ElevatedButton(
                          onPressed:
                              () => setState(() => activeFilter = filter),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isActive
                                    ? const Color(0xFFD32F2F)
                                    : Colors.grey.shade300,
                            foregroundColor:
                                isActive ? Colors.white : Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                          ),
                          child: Text(filter),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),

          // Liste des incidents
          Expanded(
            child:
                filteredIncidents.isEmpty
                    ? Center(
                      child: Text(
                        'Aucun ${activeFilter.toLowerCase()} trouvé',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    )
                    : ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: filteredIncidents.length,
                      itemBuilder: (context, index) {
                        final incident = filteredIncidents[index];
                        final statusIcon =
                            incident['status'] == 'completed'
                                ? const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 30,
                                )
                                : const Icon(
                                  Icons.access_time,
                                  color: Colors.orange,
                                  size: 30,
                                );

                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      incident['icon'],
                                      color: incident['iconColor'],
                                      size: 30,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        incident['location'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    statusIcon,
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    const Text(
                                      'Date: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(incident['date']),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Text(
                                      'Heure: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(incident['time']),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Description: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(incident['description']),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
