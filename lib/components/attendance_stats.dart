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
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(
                      0.1), // Reduce the opacity of the background color
                ),
                child: Icon(icon,
                    size: 24, color: color), // Keep the icon color as it is
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: 0.6,
                    child: Text(
                      title,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
