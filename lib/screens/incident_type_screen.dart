import 'package:flutter/material.dart';
import '../routes.dart';

class IncidentTypeScreen extends StatelessWidget {
  const IncidentTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                // Bouton de retour
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
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

                const SizedBox(width: 10),

                // Titre centré
                Expanded(
                  child: Center(
                    child: const Text(
                      'Quels types d\'incidents souhaitez-vous signalez ??',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Contenu principal - Grid avec les types d'incidents
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  // Bouton Accident de route
                  InkWell(
                    onTap: () {
                      // Navigation vers l'écran de rapport d'accident
                      Navigator.pushNamed(context, accidentReportRoute);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icône d'accident de voiture
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.car_crash,
                                color: Colors.red,
                                size: 30,
                              ),
                              Icon(
                                Icons.local_fire_department,
                                color: Colors.orange,
                                size: 30,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Accident de route',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bouton Incendie
                  InkWell(
                    onTap: () {
                      // Navigation vers l'écran de rapport d'incendie
                      Navigator.pushNamed(context, fireReportRoute);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icône d'incendie
                          Icon(
                            Icons.local_fire_department,
                            color: Colors.orange,
                            size: 50,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Incendie',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bouton Urgence médicale
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, medicalReportRoute);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.medical_services,
                                color: Colors.red,
                                size: 30,
                              ),
                              Icon(
                                Icons.medication,
                                color: Colors.red,
                                size: 30,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Urgence médicale',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bouton Autres Urgences
                  InkWell(
                    onTap: () {
                      // Cette fonctionnalité n'est pas encore implémentée
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Fonctionnalité à venir')),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icône d'autres urgences (point d'interrogation)
                          Icon(
                            Icons.help_outline,
                            color: Colors.blue,
                            size: 50,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Autres Urgences',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Note en bas
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.blue.shade100,
            child: const Center(
              child: Text(
                'NB: suivez les instructions etapes par etapes',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
