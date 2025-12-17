import 'package:flutter/material.dart';
import '../routes.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: const Color(0xFFD32F2F),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNotificationItem(
            icon: Icons.warning_amber,
            title: "Nouvel incendie signalé",
            subtitle: "Marché Dantokpa, Cotonou",
            time: "Il y a 15 min",
            color: Colors.orange,
          ),
          _buildNotificationItem(
            icon: Icons.car_crash,
            title: "Accident routier",
            subtitle: "Route de l'aéroport, PK10",
            time: "Il y a 2h",
            color: Colors.red,
          ),
          _buildNotificationItem(
            icon: Icons.check_circle,
            title: "Votre signalement traité",
            subtitle: "Incendie à Godomey",
            time: "Hier, 14:30",
            color: Colors.green,
          ),
          _buildNotificationItem(
            icon: Icons.info,
            title: "Alerte météo",
            subtitle: "Fortes pluies prévues à Porto-Novo",
            time: "12/05/2023",
            color: Colors.blue,
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(
        context,
        2,
      ), // 2 = index Notifications
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    required Color color,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle),
            const SizedBox(height: 4),
            Text(time, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
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
