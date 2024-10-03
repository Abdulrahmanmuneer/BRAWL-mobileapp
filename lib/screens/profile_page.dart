import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/me.png'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Muneer',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'muneer678@gmail.com',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Edit Username',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                
              },
            ),
            Divider(),
            ListTile(
              leading: const Icon(Icons.lock),
              title: Text(
                'Edit Password',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: Text(
                'Enable Notifications',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
              
              },
            ),
            Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              title: Text(
                'About',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text(
                'Delete Account',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                'Logout',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                
                Navigator.pushNamedAndRemoveUntil(
                    context, '/loginpage2', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
