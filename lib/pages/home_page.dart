import 'dart:async';
import 'package:caulva/components/appbar.dart';
import 'package:caulva/components/attendance_stats.dart';
import 'package:caulva/components/quick_attendance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? _timer;
  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 234, 234),
      appBar: const CustomAppBar(
        title: 'Shahil Shaikh',
        subtitle: '210303108221',
        leading: Icon(Icons.person),
        actions: Icon(Icons.search),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              QuickAttendanceCard(
                subTitle: '7-IT A',
              ),
              SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AttendanceStatCard(
                    icon: Icons.people,
                    iconbg: Colors.blue,
                    color: Colors.blue,
                    title: 'Total Student',
                    value: '400',
                  ),
                  SizedBox(width: 16),
                  AttendanceStatCard(
                    iconbg: Colors.orange,
                    icon: Icons.attach_money,
                    color: Colors.orange,
                    title: 'Leave',
                    value: '25',
                  ),
                ],
              ),
              SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AttendanceStatCard(
                    iconbg: Colors.pink,
                    icon: Icons.payment,
                    color: Colors.pink,
                    title: 'Absent',
                    value: '400',
                  ),
                  SizedBox(width: 16),
                  AttendanceStatCard(
                    iconbg: Colors.lightBlue,
                    icon: Icons.account_balance,
                    color: Colors.lightBlue,
                    title: 'Present',
                    value: '315',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
