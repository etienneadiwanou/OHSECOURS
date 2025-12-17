import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../routes.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen>
    with TickerProviderStateMixin {
  late AnimationController _pressController;
  late Animation<double> _pressAnimation;
  late AnimationController _blinkController;
  late Animation<double> _blinkAnimation;

  @override
  void initState() {
    super.initState();

    // 🔔 Écoute des notifications pendant que l'app est au premier plan
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Eviter d'utiliser le BuildContext si le widget est démonté
      if (!mounted) return;
      if (message.notification != null) {
        final title = message.notification!.title ?? 'Alerte';
        final body = message.notification!.body ?? '';
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("$title\n$body")));
      }
    });

    _pressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _pressAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeInOut),
    );

    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _blinkAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.8, end: 1.2), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 0.8), weight: 50),
    ]).animate(_blinkController);
  }

  @override
  void dispose() {
    _pressController.dispose();
    _blinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: const Color(0xFFD32F2F),
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            child: const Center(
              child: Text(
                'UNE URGENCE?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Appuyez sur le bouton ci-dessous.\nLes secours interviendront rapidement.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          const SizedBox(height: 80),
          Center(
            child: GestureDetector(
              onTapDown: (_) => _pressController.forward(),
              onTapUp: (_) {
                _pressController.reverse();
                Navigator.pushNamed(context, incidentTypeRoute);
              },
              onTapCancel: () => _pressController.reverse(),
              child: AnimatedBuilder(
                animation: Listenable.merge([_pressAnimation, _blinkAnimation]),
                builder: (context, child) {
                  return Transform.scale(
                    scale: _pressAnimation.value * _blinkAnimation.value,
                    child: Container(
                      width: 240,
                      height: 240,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red.shade50,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.4),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red.shade100,
                          ),
                          child: Center(
                            child: Container(
                              width: 160,
                              height: 160,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red.shade200,
                              ),
                              child: Center(
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xFFD32F2F),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.touch_app,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const Spacer(),
          _buildBottomNavBar(context, 0),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context, int currentIndex) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            context: context,
            icon: Icons.home,
            label: 'Accueil',
            isActive: currentIndex == 0,
            onTap: () {
              if (currentIndex != 0) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  emergencyRoute,
                  (route) => false,
                );
              }
            },
          ),
          _buildNavItem(
            context: context,
            icon: Icons.history,
            label: 'Historique',
            isActive: currentIndex == 1,
            onTap: () {
              if (currentIndex != 1) {
                Navigator.pushNamed(context, historyRoute);
              }
            },
          ),
          _buildNavItem(
            context: context,
            icon: Icons.notifications,
            label: 'Notifications',
            isActive: currentIndex == 2,
            onTap: () {
              if (currentIndex != 2) {
                Navigator.pushNamed(context, notificationRoute);
              }
            },
          ),
          _buildNavItem(
            context: context,
            icon: Icons.settings,
            label: 'Paramètres',
            isActive: currentIndex == 3,
            onTap: () {
              if (currentIndex != 3) {
                Navigator.pushNamed(context, settingsRoute);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:
              isActive
                  ? const Color(0xFFD32F2F).withOpacity(0.1)
                  : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? const Color(0xFFD32F2F) : Colors.grey.shade700,
              size: 24,
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                fontSize: 12,
                color:
                    isActive ? const Color(0xFFD32F2F) : Colors.grey.shade700,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                decoration:
                    isActive ? TextDecoration.underline : TextDecoration.none,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
