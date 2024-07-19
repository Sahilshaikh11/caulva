import 'dart:async';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class ImageCapture {
  static const url =
      'http://192.168.205.204:3131/shot.jpg'; // Replace with your IP camera URL

  static Future<bool> captureAndUploadImage() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        await _uploadImageToFirebase(response.bodyBytes);
        return true; // Success
      } else {
        print('Failed to capture image: ${response.statusCode}');
        return false; // Failure
      }
    } catch (e) {
      print('Failed to capture image: $e');
      return false; // Failure
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

  static Future<bool> startImageCapture() async {
    const interval = Duration(seconds: 2); // Set your desired interval here
    int imagesCaptured = 0;
    bool success = true;

    final completer = Completer<bool>();

    Timer.periodic(interval, (Timer timer) async {
      if (imagesCaptured < 5) {
        bool result = await captureAndUploadImage();
        if (!result) success = false;
        imagesCaptured++;
      } else {
        timer.cancel(); // Stop the timer after capturing 5 images
        completer.complete(success);
      }
    });

    return completer.future;
  }
}
