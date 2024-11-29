import 'package:flutter/material.dart';
import 'package:gluco_balance/Screens/dashboard.dart';
import 'package:gluco_balance/Screens/insights.dart';
import 'package:gluco_balance/Screens/notification.dart';
import 'package:gluco_balance/Screens/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashBoard(),
    const SettingScreen(),
    const InSightScreen(),
    const NotificationScreen()
  ];

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // Logo on the left using the leading property
        title: const Padding(
          padding: const EdgeInsets.all(8.0), // Adjust padding as needed
          child: SizedBox(
              width: 200, child: Image(image: AssetImage("images/logo.png"))),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.bluetooth_searching_rounded),
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Add Profile action here
            },
          ),
        ],
        elevation: 0,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.teal[800],
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights),
            label: 'Insights',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
        ],
      ),
    );
  }
}
