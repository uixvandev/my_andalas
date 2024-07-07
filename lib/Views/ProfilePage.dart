import 'package:flutter/material.dart';
import 'package:my_andalas/Models/ProfileModel.dart';
import 'package:my_andalas/Services/Api.dart';
import 'package:my_andalas/Views/Component/Button.dart';
import 'package:my_andalas/Views/LoginScreen.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7), // UIKit-like background color
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
            color: Color(0xFF007AFF)), // UIKit-like blue color
        title: const Text('Profil',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.withOpacity(0.2), // UIKit-like separator color
            height: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<Data?>(
          future: api.getProfile(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Data? profile = snapshot.data;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.fromBorderSide(BorderSide(
                                color: Colors.grey.withOpacity(0.2), width: 1)),
                          ),
                          child: Image.asset('assets/images/avatar.png'),
                        ),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile?.name ?? "-", // Display user name
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SF-Pro-Display',
                              ),
                            ),
                            Text(
                              profile?.nim ?? "-", // Display student ID
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey.withOpacity(0.6),
                                fontFamily: 'SF-Pro-Display',
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Year: ${profile?.year ?? "-"}', // Display year
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey.withOpacity(0.6),
                                fontFamily: 'SF-Pro-Display',
                              ),
                            ),
                            Text(
                              'Department: ${profile?.departmentName ?? "-"}', // Display department name
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey.withOpacity(0.6),
                                fontFamily: 'SF-Pro-Display',
                              ),
                            ),
                            Text(
                              'Email: ${profile?.email ?? "-"}', // Display email
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey.withOpacity(0.6),
                                fontFamily: 'SF-Pro-Display',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () async {
                        await api.logout();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Loginscreen()));
                      },
                      style: buttonPrimary,
                      child: const Text('Logout',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: Error profile ${snapshot.error}');
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
