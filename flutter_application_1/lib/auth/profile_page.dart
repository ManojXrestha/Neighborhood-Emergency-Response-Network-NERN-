import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _shareLocation = true;
  bool _earthquakeAlerts = true;
  bool _fireAlerts = true;
  String _language = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1565C0),
              Color(0xFF1E88E5),
              Color(0xFF64B5F6),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Profile & Settings",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.notifications, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 25),

                // Profile Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: _cardDecoration(),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundColor: Color(0xFF1565C0),
                        child: Icon(Icons.person, color: Colors.white, size: 40),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Priya Sharma",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "priya.sharma@gmail.com",
                        style: TextStyle(color: Colors.black54),
                      ),
                      const Text(
                        "Thamel, Kathmandu",
                        style: TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Column(
                            children: [
                              Text("24",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue)),
                              Text("Alerts Received",
                                  style: TextStyle(color: Colors.black54)),
                            ],
                          ),
                          Column(
                            children: [
                              Text("8",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                              Text("Times Helped",
                                  style: TextStyle(color: Colors.black54)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Privacy Settings
                _sectionTitle(Icons.privacy_tip, "Privacy Settings"),
                _cardContainer(
                  child: SwitchListTile(
                    activeThumbColor: const Color(0xFF1565C0),
                    secondary:
                        const Icon(Icons.location_on, color: Color(0xFF1565C0)),
                    title: const Text("Share Location",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text(
                        "Allow neighbors to see your location during emergencies"),
                    value: _shareLocation,
                    onChanged: (value) {
                      setState(() => _shareLocation = value);
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Alert Preferences
                _sectionTitle(Icons.notifications_active, "Alert Preferences"),
                _cardContainer(
                  child: Column(
                    children: [
                      SwitchListTile(
                        activeThumbColor: const Color(0xFF1565C0),
                        secondary: const Icon(Icons.waves_outlined,
                            color: Color(0xFF1565C0)),
                        title: const Text("Earthquake Alerts",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: const Text("Magnitude 4.0 and above"),
                        value: _earthquakeAlerts,
                        onChanged: (value) {
                          setState(() => _earthquakeAlerts = value);
                        },
                      ),
                      SwitchListTile(
                        activeThumbColor: const Color(0xFF1565C0),
                        secondary: const Icon(Icons.local_fire_department,
                            color: Color.fromARGB(255, 192, 21, 41)),
                        title: const Text("Fire Alerts",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: const Text("Structure fires in your area"),
                        value: _fireAlerts,
                        onChanged: (value) {
                          setState(() => _fireAlerts = value);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Language Preference
                _sectionTitle(Icons.language, "Language Preference"),
                _cardContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _languageButton("English", _language == "English", () {
                        setState(() => _language = "English");
                      }),
                      _languageButton("नेपाली", _language == "नेपाली", () {
                        setState(() => _language = "नेपाली");
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Emergency Contacts
                _sectionTitle(Icons.contacts, "Emergency Contacts"),
                _cardContainer(
                  child: Column(
                    children: [
                      _contactTile("Aditya Poudal", "Spouse • +977 9809364484"),
                      const Divider(),
                      _contactTile("Subarna Sathi", "Daughter • +977 9809364484"),
                      const Divider(),
                      _contactTile("Sandip Thapa", "Family Doctor • +977 9809364484"),
                      const SizedBox(height: 10),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add, color: Color(0xFF1565C0)),
                        label: const Text(
                          "Add Emergency Contact",
                          style: TextStyle(color: Color(0xFF1565C0)),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Account Management
                _sectionTitle(Icons.manage_accounts, "Account Management"),
                _cardContainer(
                  child: Column(
                    children: [
                      // Edit Profile Navigation
                      ListTile(
                        leading:
                            const Icon(Icons.edit, color: Color(0xFF1565C0)),
                        title: const Text("Edit Profile Information"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditProfilePage()),
                          );
                        },
                      ),
                      const Divider(),

                      // Change Password Navigation
                      ListTile(
                        leading: const Icon(Icons.lock, color: Color(0xFF1565C0)),
                        title: const Text("Change Password"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>const ChangePasswordPage()),
                          );
                        },
                      ),
                      const Divider(),

                      // Logout Button
                      ListTile(
                        leading:
                            const Icon(Icons.logout, color: Colors.red),
                        title: const Text(
                          "Logout",
                          style: TextStyle(color: Colors.red),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            '/login',
                            (Route<dynamic> route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---
  BoxDecoration _cardDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      );

  Widget _sectionTitle(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }

  Widget _cardContainer({required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: child,
    );
  }

  Widget _languageButton(String text, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF1565C0) : Colors.transparent,
          border: Border.all(color: const Color(0xFF1565C0)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xFF1565C0),
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _contactTile(String name, String details) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Color(0xFF1565C0),
        child: Icon(Icons.person, color: Colors.white),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(details),
      trailing: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1565C0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        icon: const Icon(Icons.call, size: 18, color: Colors.white),
        label: const Text("Call", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

// --- Placeholder Pages for Navigation ---

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: const Center(child: Text("Edit Profile Screen")),
    );
  }
}

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Change Password")),
      body: const Center(child: Text("Change Password Screen")),
    );
  }
}
