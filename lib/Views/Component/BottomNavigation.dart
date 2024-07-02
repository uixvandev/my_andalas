import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:my_andalas/Styles/Theme.dart';
import 'package:my_andalas/Views/Home.dart';
import 'package:my_andalas/Views/ListLogbook.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    const Listlogbook(),
    // const ListTa(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 4,
              offset: Offset(0, -2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            // Add your bottom navigation bar items here
            BottomNavigationBarItem(
              icon: Icon(IconlyBold.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyBold.document),
              label: 'Logbook',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyBold.folder),
              label: 'Tugas Akhir',
            ),
          ],
          selectedItemColor: green1,
          unselectedItemColor: const Color(0xFFCBCBCB),
          enableFeedback: true,
        ),
      ),
    );
  }
}
