import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          leading: Theme(
            data: Theme.of(context).copyWith(
              iconTheme:
                  IconThemeData(color: Colors.white), // Change the color here
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          title: const Text(
            'Profile Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Icon(
              Icons.person,
              size: 72,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              currentUser!.email!,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
