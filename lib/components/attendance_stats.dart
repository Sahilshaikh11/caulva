import 'package:caulva/theme/colors.dart';
import 'package:flutter/material.dart';

class AttendanceStatCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color iconbg;
  final String title;
  final String value;

  const AttendanceStatCard({
    Key? key,
    required this.icon,
    required this.color,
    required this.title,
    required this.value,
    required this.iconbg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: AppColors.textColorWhite,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  width: 45,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.withOpacity(
                        0.1), // Reduce the opacity of the background color
                  ),
                  // child: Icon(icon,
                  //     size: 32, color: color), // Keep the icon color as it is
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: 1,
                    child: Text(
                      title,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.headingTextColor),
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
