import 'package:flutter/material.dart';
import '../routes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
        backgroundColor: const Color(0xFFD32F2F),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Préférences',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          _buildSettingsItem(
            icon: Icons.notifications_active,
            title: "Notifications",
            subtitle: "Gérer les alertes et notifications",
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.language,
            title: "Langue",
            subtitle: "Français",
            onTap: () {},
          ),

          const Divider(height: 20),
          const Text(
            'Aide',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          _buildSettingsItem(
            icon: Icons.help,
            title: "Centre d'aide",
            subtitle: "FAQ et support",
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.phone,
            title: "Contacts d'urgence",
            subtitle: "Numéros utiles au Bénin",
            onTap: () {
              _showEmergencyNumbers(context);
            },
          ),
          _buildSettingsItem(
            icon: Icons.info,
            title: "À propos",
            subtitle: "Version 1.0.0",
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(
        context,
        3,
      ), // 3 = index Paramètres
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFD32F2F)),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  void _showEmergencyNumbers(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Numéros d\'urgence Bénin'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                ListTile(
                  leading: Icon(Icons.local_police, color: Colors.blue),
                  title: Text('Police nationale'),
                  subtitle: Text('117 / 00229 21 31 12 12'),
                ),
                ListTile(
                  leading: Icon(Icons.local_fire_department, color: Colors.red),
                  title: Text('Pompiers'),
                  subtitle: Text('118 / 00229 21 31 54 54'),
                ),
                ListTile(
                  leading: Icon(Icons.medical_services, color: Colors.green),
                  title: Text('SAMU'),
                  subtitle: Text('00229 21 32 92 92'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Fermer'),
              ),
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
