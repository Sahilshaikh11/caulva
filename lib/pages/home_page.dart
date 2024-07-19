import 'dart:async';
import 'package:caulva/components/appbar.dart';
import 'package:caulva/components/attendance_stats.dart';
import 'package:caulva/components/quick_attendance.dart';
import 'package:caulva/theme/colors.dart';
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
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(
        // title: 'Shahil Shaikh',
        subtitle: '210303108221',
        leading: Icon(Icons.person),
        actions: Icon(Icons.search),
        height: 70,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              QuickAttendanceCard(
                subTitle: '7-IT A',
              ),
              // SizedBox(height: 8),
              const Opacity(
                opacity: 0.05,
                child: Divider(
                  height: 20,
                  thickness: 2,
                  indent: 5,
                  endIndent: 5,
                  color: AppColors.textColorBlack,
                ),
              ),
              SizedBox(height: 6),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AttendanceStatCard(
                    icon: Icons.people,
                    iconbg: AppColors.summaryCard1,
                    color: AppColors.summaryCard1,
                    title: 'Total Student',
                    value: '400',
                  ),
                  SizedBox(width: 16),
                  AttendanceStatCard(
                    iconbg: AppColors.summaryCard2,
                    icon: Icons.attach_money,
                    color: AppColors.summaryCard2,
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
                    iconbg: AppColors.summaryCard3,
                    icon: Icons.payment,
                    color: AppColors.summaryCard3,
                    title: 'Absent',
                    value: '400',
                  ),
                  SizedBox(width: 16),
                  AttendanceStatCard(
                    iconbg: AppColors.summaryCard4,
                    icon: Icons.account_balance,
                    color: AppColors.summaryCard4,
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