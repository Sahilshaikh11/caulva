import 'package:caulva/features/image_capture.dart';
import 'package:caulva/theme/colors.dart';
import 'package:flutter/material.dart';

class QuickAttendanceCard extends StatelessWidget {
  final String subTitle;

  QuickAttendanceCard({required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Opacity(
            opacity: 0.6,
            child: Text("Quick Attendance", style: TextStyle(fontSize: 14)),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: AppColors.textColorWhite,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Opacity(
                      opacity: 0.6,
                      child: Text(subTitle,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _startImageCapture(context);
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Capture',
                                style: TextStyle(
                                    color: AppColors.textColorWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            SizedBox(width: 5),
                            Icon(Icons.send, color: AppColors.textColorWhite, size: 20),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _startImageCapture(BuildContext context) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Capturing Images'),
            ],
          ),
        );
      },
    );

    // Start capturing images
    bool success = await ImageCapture.startImageCapture();

    Navigator.of(context).pop(); // Close the loading dialog

    if (success) {
      // Show success dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Images captured successfully!'),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the success dialog
                },
              ),
            ],
          );
        },
      );
    } else {
      // Show failure dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to capture images.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Retry'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the error dialog
                  _startImageCapture(context); // Retry capturing images
                },
              ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the error dialog
                },
              ),
            ],
          );
        },
      );
    }
  }
}
