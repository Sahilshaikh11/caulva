import 'dart:async';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class ImageCapture {
  static const url =
      'http://192.168.85.139:3131/shot.jpg'; // Replace with your IP camera URL

  static Future<void> captureAndUploadImage() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      await _uploadImageToFirebase(response.bodyBytes);
    } else {
      print('Failed to capture image: ${response.statusCode}');
    }
  }

  static Future<void> _uploadImageToFirebase(Uint8List imageBytes) async {
    try {
      final now = DateTime.now();
      final formattedDate = DateFormat('dd-MM-yyyy').format(now);
      final formattedWeekday = DateFormat('EEEE').format(now);
      final formattedTime = DateFormat('HH:mm:ss').format(now);
      final storageRef = FirebaseStorage.instance
          .ref()
          .child(formattedDate)
          .child('${now.hour}')
          .child('$formattedDate-$formattedWeekday-$formattedTime.jpg');
      await storageRef.putData(imageBytes);
      print('Image uploaded to Firebase Storage');
    } catch (e) {
      print('Failed to upload image: $e');
    }
  }

  static void startImageCapture() {
    const interval = Duration(seconds: 5); // Set your desired interval here
    int imagesCaptured = 0;

    Timer.periodic(interval, (Timer timer) async {
      if (imagesCaptured < 5) {
        await captureAndUploadImage();
        imagesCaptured++;
      } else {
        timer.cancel(); // Stop the timer after capturing 5 images
      }
    });
  }
}
