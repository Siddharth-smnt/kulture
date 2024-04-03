import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/services/authentication/authentication.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthServices _auth = AuthServices();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    _nameController.text = user?.displayName ?? "";
    _emailController.text = user?.email ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white, // Set text color to white
            fontWeight: FontWeight.bold, // Set text to bold
          ),
        ),
        centerTitle: true, // Center align the app bar title
        backgroundColor: Colors.orange[700], // Set the app bar color
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: StreamBuilder<User?>(
            stream: _auth.user,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome, ${snapshot.data!.displayName ?? 'User'}!',
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
                      SizedBox(height: 10),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          // Update email
                          if (_emailController.text.isNotEmpty) {
                            try {
                              await snapshot.data!
                                  .updateEmail(_emailController.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Email updated successfully')));
                            } catch (error) {
                              print(error.toString());
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Failed to update email')));
                            }
                          }

                          // Update display name
                          if (_nameController.text.isNotEmpty) {
                            try {
                              await snapshot.data!
                                  .updateDisplayName(_nameController.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Name updated successfully')));
                            } catch (error) {
                              print(error.toString());
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Failed to update name')));
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFCC5602), // Set button color
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
                          Navigator.pushNamed(context, AppRoutes.initialRoute);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFCC5602), // Set button color
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
                  );
                } else {
                  return Text('User not logged in');
                }
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
