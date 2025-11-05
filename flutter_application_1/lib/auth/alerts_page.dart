import 'package:flutter/material.dart';

class AlertsPage extends StatefulWidget {
  const AlertsPage({super.key});

  @override
  State<AlertsPage> createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
  String selectedFilter = "All";

  @override
  Widget build(BuildContext context) {
    // Filter logic for alerts
    final alerts = [
      {
        "icon": Icons.home_work_rounded,
        "iconColor": Colors.red,
        "title": "Earthquake Alert",
        "description":
            "5.2 magnitude earthquake detected 15km north of downtown.",
        "location": "Downtown Area",
        "time": "2 minutes ago",
        "severity": "HIGH",
        "severityColor": Colors.orange,
      },
      {
        "icon": Icons.local_fire_department,
        "iconColor": Colors.deepOrange,
        "title": "Structure Fire",
        "description":
            "Large structure fire reported near Main Street District.",
        "location": "Main Street District",
        "time": "15 minutes ago",
        "severity": "CRITICAL",
        "severityColor": Colors.redAccent,
      },
    ];

    // Filtered alerts based on selectedFilter
    final filteredAlerts = alerts.where((alert) {
      if (selectedFilter == "All") return true;
      return alert["severity"].toString().toUpperCase() ==
          selectedFilter.toUpperCase();
    }).toList();

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Emergency Alerts",
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

                // Active Emergency
                _sectionTitle(Icons.warning_amber_rounded, "Active Emergency"),
                _cardContainer(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.warning_rounded,
                            color: Colors.red),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "2 Critical Alerts in Your Area",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Stay alert and follow safety instructions.",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Filter Section
                _sectionTitle(Icons.filter_alt, "Filter Alerts"),
                _cardContainer(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _filterChip("All"),
                        _filterChip("Critical"),
                        _filterChip("High"),
                        _filterChip("Medium"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Quick Actions
                _sectionTitle(Icons.phone, "Quick Actions"),
                _cardContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _actionButton(Icons.call, "Call 911", Colors.red),
                      _actionButton(Icons.report, "Report Alert", Colors.orange),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Alerts Feed
                _sectionTitle(Icons.notifications_active, "Recent Alerts"),
                ...filteredAlerts.map((alert) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _alertCard(
                        icon: alert["icon"] as IconData,
                        iconColor: alert["iconColor"] as Color,
                        title: alert["title"] as String,
                        description: alert["description"] as String,
                        location: alert["location"] as String,
                        time: alert["time"] as String,
                        severity: alert["severity"] as String,
                        severityColor: alert["severityColor"] as Color,
                      ),
                    )),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---- Helper Widgets ----

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

  Widget _cardContainer({required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: child,
    );
  }

  Widget _filterChip(String label) {
    final bool selected = selectedFilter == label;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        selectedColor: Colors.blue,
        labelStyle: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
        onSelected: (_) {
          setState(() {
            selectedFilter = label;
          });
        },
      ),
    );
  }

  Widget _actionButton(IconData icon, String text, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () {},
          icon: Icon(icon, color: Colors.white),
          label: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _alertCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    required String location,
    required String time,
    required String severity,
    required Color severityColor,
  }) {
    return _cardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: severityColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  severity,
                  style: TextStyle(
                    color: severityColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(color: Colors.black87),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(location, style: const TextStyle(color: Colors.black54)),
              const SizedBox(width: 16),
              const Icon(Icons.access_time, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(time, style: const TextStyle(color: Colors.black54)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1565C0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {},
                child: const Text("Details"),
              ),
              const SizedBox(width: 10),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.share, size: 18),
                label: const Text("Share"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
