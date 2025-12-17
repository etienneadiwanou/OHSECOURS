import 'package:flutter/material.dart';
import '../routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Pas de AppBar pour correspondre à l'image
      body: Container(
        // Fond rouge pour toute la page
        color: const Color(0xFFD32F2F),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Espace pour centrer verticalement les éléments
              const Spacer(),

              // Texte principal "Votre alerte, notre rapidité"
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Votre alerte, notre rapidité',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 40),

              // Image de l'ambulance avec des lignes de vitesse
              Stack(
                alignment: Alignment.center,
                children: [
                  // Container blanc pour l'ambulance
                  Container(
                    height: 120,
                    width: 220,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  // Positionnement des éléments de l'ambulance
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Lignes de vitesse
                      Column(
                        children: List.generate(
                          3,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            width: 20,
                            height: 3,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      // Image de l'ambulance (simulée avec des containers)
                      Stack(
                        children: [
                          // Corps principal de l'ambulance
                          Container(
                            height: 80,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                          ),
                          // Croix rouge
                          Positioned(
                            left: 20,
                            top: 20,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          // Fenêtre de l'ambulance
                          Positioned(
                            right: 30,
                            top: 20,
                            child: Container(
                              height: 40,
                              width: 30,
                              color: Colors.lightBlue.withOpacity(0.5),
                            ),
                          ),
                          // Roues
                          Positioned(
                            bottom: 5,
                            left: 30,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 30,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          // Bande bleue et rouge sur le côté de l'ambulance
                          Positioned(
                            top: 35,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 8,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.blue, Colors.red.shade700],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const Spacer(),

              // Bouton "COMMENCER"
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigation vers l'écran d'urgence
                    Navigator.pushNamed(context, emergencyRoute);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFFD32F2F),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('COMMENCER'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
