import 'package:caulva/pages/profile_page.dart';
import 'package:caulva/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void signOut(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Sign Out'),
      content: Text('Do you want to sign out?'),
      actions: <Widget>[
        ElevatedButton(
          child: Text('No'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        ElevatedButton(
          child: Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    ),
  ).then((value) {
    if (value) {
      FirebaseAuth.instance.signOut();
    }
  });
}

void showDropdownMenu(BuildContext context) {
  showMenu(
    color: AppColors.accentColor,
    context: context,
    position: const RelativeRect.fromLTRB(
        100, 100, 100, 100), // adjust the position as needed
    items: [
      const PopupMenuItem(
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: AppColors.textColorWhite,
            ), // Leading icon
            SizedBox(width: 10), // Add some space between icon and text
            Text(
              'Profile',
              style: TextStyle(
                  color: AppColors.textColorWhite), // White text color
            ),
          ],
        ),
        value: 'profile',
        enabled: true,
        height: 30, // Adjust the height as needed
      ),
      PopupMenuItem(
        child: Row(
          children: [
            Icon(
              Icons.logout,
              color: Colors.white,
            ), // Leading icon
            SizedBox(width: 10), // Add some space between icon and text
            Text(
              'Sign out',
              style: TextStyle(color: Colors.white), // White text color
            ),
          ],
        ),
        value: 'signout',
        enabled: true,
        height: 30, // Adjust the height as needed
      ),
    ],
    elevation: 8.0, // Set elevation here
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Add rounded corners
    ),
  ).then((value) {
    if (value == 'profile') {
      // Handle the profile option tap
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ProfileView()),
      );
    } else if (value == 'signout') {
      // Handle the sign out option tap
      signOut(context);
    }
  });
}
