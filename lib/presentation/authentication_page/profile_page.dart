import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/presentation/authentication_page/onboarding_screen.dart';
import 'package:mandar_purushottam_s_application1/services/authentication/authentication.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  final AuthServices _auth = AuthServices();

  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameController.text = _auth.user?.displayName ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[700],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome, ${_auth.user?.displayName ?? 'User'}!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Update display name
                  if (_nameController.text.isNotEmpty) {
                    try {
                      await _auth.user!.updateDisplayName(_nameController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Name updated successfully')));
                    } catch (error) {
                      print(error.toString());
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to update name')));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFCC5602), // Set button color
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await _auth.logout();
                  Navigator.pushReplacementNamed(
                      context, AppRoutes.onboardingScreen);
                  // Navigator.pushReplacementNamed(
                  //     context, AppRoutes.onboardingScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFCC5602), // Set button color
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
