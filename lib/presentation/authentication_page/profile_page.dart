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
    print(user);
    _nameController.text = user?.displayName ?? "";
    _emailController.text = user?.email ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
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
                      Text('Welcome, ${snapshot.data!.displayName ?? 'User'}!', style: TextStyle(color: Colors.black),),
                      SizedBox(height: 20),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          // Update email
                          if (_emailController.text.isNotEmpty) {
                            try {
                              await snapshot.data!.updateEmail(_emailController.text);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email updated successfully')));
                            } catch (error) {
                              print(error.toString());
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update email')));
                            }
                          }

                          // Update display name
                          if (_nameController.text.isNotEmpty) {
                            try {
                              await snapshot.data!.updateDisplayName(_nameController.text);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Name updated successfully')));
                            } catch (error) {
                              print(error.toString());
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update name')));
                            }
                          }
                        },
                        child: Text('Update', style: TextStyle(color: Colors.white),),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          await _auth.logout();
                          Navigator.pushNamed(context, AppRoutes.initialRoute);
                        },
                        child: Text('Logout', style: TextStyle(color: Colors.white),),
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
