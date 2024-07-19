//import 'dart:convert';

import 'package:caulva/theme/colors.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    return Scaffold(
      // ignore: prefer_const_constructors
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.accentColor,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              width: 2,
            ),
            Column(
              children: [
                Stack(children: [
                  Padding(
                    padding: EdgeInsets.only(top: Height * 0.04),
                    child: Center(
                      child: Container(
                        height: (Height * 0.137),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.accentColor, width: 2)),
                        // width: (width * 0.09),

                        child: ClipOval(
                          child: Expanded(
                            child: Image.asset(
                              'lib/assets/images/img.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.56, top: Height * 0.14),
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.accentColor),
                      child: ClipOval(
                        child: Padding(
                          padding: EdgeInsets.all(width * 0.01),
                          child: Icon(
                            Icons.mode_edit,
                            size: width * 0.05,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
                SizedBox(
                  height: Height * 0.012,
                ),
                const Text(
                  'shahil',
                  style: TextStyle(
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 21),
                ),
                const Text(
                  "shahil@paruluniversity.ac.in",
                  style: TextStyle(
                      color: AppColors.headingTextColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 12),
                )
              ],
            ),
            SizedBox(
              height: (Height * 0.035),
            ),

            Divider(
              height: Height * 0.07,
              indent: width * 0.05,
              endIndent: width * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.info),
                        SizedBox(
                          width: Height * 0.013,
                        ),
                        const Text(
                          'About us',
                          style: TextStyle(
                              color: Color.fromARGB(255, 150, 149, 149),
                              fontSize: 17.5,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: Height * 0.02,
                          color: const Color.fromARGB(255, 150, 149, 149),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Height * 0.02,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.privacy_tip),
                        SizedBox(
                          width: Height * 0.013,
                        ),
                        const Text(
                          'Privacy policy',
                          style: TextStyle(
                              color: Color.fromARGB(255, 150, 149, 149),
                              fontSize: 17.5,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: Height * 0.02,
                          color: const Color.fromARGB(255, 150, 149, 149),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Height * 0.02,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.document_scanner),
                        SizedBox(
                          width: Height * 0.013,
                        ),
                        const Text(
                          'Terms and conditions',
                          style: TextStyle(
                              color: Color.fromARGB(255, 150, 149, 149),
                              fontSize: 17.5,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: Height * 0.02,
                          color: const Color.fromARGB(255, 150, 149, 149),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Height * 0.02,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.help),
                        SizedBox(
                          width: Height * 0.013,
                        ),
                        const Text(
                          'Help',
                          style: TextStyle(
                              color: Color.fromARGB(255, 150, 149, 149),
                              fontSize: 17.5,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: Height * 0.02,
                          color: const Color.fromARGB(255, 150, 149, 149),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Height * 0.02,
                    ),
                    //logout button
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('LOGOUT'),
                              content: const Text(
                                  "Are you sure you want to exit!!!"),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('No'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Yes'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.logout),
                          SizedBox(
                            width: Height * 0.013,
                          ),
                          const Text(
                            'Logout',
                            style: TextStyle(
                                color: AppColors.accentColor,
                                fontSize: 17.5,
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.06,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
