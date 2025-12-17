import 'package:flutter/material.dart';

class AccidentHistoryScreen extends StatelessWidget {
  const AccidentHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Données des accidents (dans une application réelle, ces données seraient récupérées depuis une base de données)
    final List<Map<String, dynamic>> accidents = [
      {
        'location': 'Akpakpa avotrou',
        'status': 'completed', // completed, pending
        'date': '25-02-2025',
        'time': '10:30',
        'description': 'collision de deux voiture',
        'vehiclesInvolved': 2,
        'injuries': 'Légères',
        'emergencyResponder': 'Pompiers + Ambulance',
      },
      {
        'location': 'Carrefour Agontikon',
        'status': 'completed',
        'date': '22-02-2025',
        'time': '08:15',
        'description': 'Moto renversée par un camion',
        'vehiclesInvolved': 2,
        'injuries': 'Graves',
        'emergencyResponder': 'Ambulance',
      },
      {
        'location': 'Route de Porto-Novo',
        'status': 'pending',
        'date': '18-02-2025',
        'time': '17:45',
        'description': 'Carambolage impliquant 3 véhicules',
        'vehiclesInvolved': 3,
        'injuries': 'Modérées',
        'emergencyResponder': 'Police + Ambulance',
      },
    ];

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

                const SizedBox(width: 20),

                // Titre
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

          // Barre de filtres - "Accident" est actif
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Bouton "Tous"
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                        ); // Retour à l'écran historique avec tous les filtres
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      child: const Text('Tous'),
                    ),
                  ),

                  // Bouton "Accident" (actif)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        // Déjà sur cette page
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      child: const Text('Accident'),
                    ),
                  ),

                  // Bouton "Incendie"
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigation vers l'écran d'historique des incendies
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/fire-history');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      child: const Text('Incendie'),
                    ),
                  ),

                  // Bouton "Urgence"
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigation vers l'écran d'historique des urgences médicales
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/medical-history');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      child: const Text('Urgence'),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Liste des accidents
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: accidents.length,
              itemBuilder: (context, index) {
                final accident = accidents[index];

                // Détermination de l'icône de statut
                Widget statusIcon;
                if (accident['status'] == 'completed') {
                  statusIcon = const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 30,
                  );
                } else {
                  statusIcon = const Icon(
                    Icons.access_time,
                    color: Colors.orange,
                    size: 30,
                  );
                }

                // Création de la carte d'accident
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
                        // En-tête de la carte avec icône, lieu et statut
                        Row(
                          children: [
                            // Icône d'accident
                            const Icon(
                              Icons.warning,
                              color: Colors.red,
                              size: 30,
                            ),

                            const SizedBox(width: 10),

                            // Lieu de l'accident
                            Expanded(
                              child: Text(
                                accident['location'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),

                            // Icône de statut
                            statusIcon,
                          ],
                        ),

                        const SizedBox(height: 15),

                        // Date et heure
                        Row(
                          children: [
                            const Text(
                              'Date: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(accident['date']),
                          ],
                        ),

                        const SizedBox(height: 5),

                        Row(
                          children: [
                            const Text(
                              'Heure: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(accident['time']),
                          ],
                        ),

                        const SizedBox(height: 5),

                        // Description
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Description: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Expanded(child: Text(accident['description'])),
                          ],
                        ),

                        const SizedBox(height: 15),

                        // Détails supplémentaires spécifiques aux accidents
                        Row(
                          children: [
                            const Text(
                              'Véhicules impliqués: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(accident['vehiclesInvolved'].toString()),
                          ],
                        ),

                        const SizedBox(height: 5),

                        Row(
                          children: [
                            const Text(
                              'Blessures: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(accident['injuries']),
                          ],
                        ),

                        const SizedBox(height: 5),

                        Row(
                          children: [
                            const Text(
                              'Secours: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(accident['emergencyResponder']),
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
