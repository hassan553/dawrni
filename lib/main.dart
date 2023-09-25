import 'package:dawrni/app/app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  sharedPreferences = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(Dawrni());
  // runApp(DevicePreview(
  //   builder: (context) => Dawrni(),
  // ));
}
/*
bool result = await InternetConnectionChecker().hasConnection;
if(result == true) {
  print('YAY! Free cute dog pics!');
} else {
  print('No internet :( Reason:');
  print(InternetConnectionChecker().lastTryResults);
}
*/
/*

  Future<void> register() async {
    // Check if the email is not already registered as a company
    final companySnapshot = await _firestore
        .collection('companies')
        .where('email', isEqualTo: email)
        .get();

    if (companySnapshot.docs.isEmpty) {
      try {
        // Register the user
        await _auth.createUserWithEmailAndPassword(
          email: email,
          password: 'password', // You can add password validation here
        );

        // Store user data in the users collection
        await _firestore.collection('users').add({
          'email': email,
          'userType': userType,
        });

        // Navigate to the next screen or perform other actions
      } catch (e) {
        print('Error registering user: $e');
      }
    } else {
      // Display an error message to the user
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Email Already Registered'),
            content: Text('This email is already registered as a company.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
*/
/*
class GoogleMapsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Google Maps'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _openGoogleMaps();
          },
          child: Text('Open Google Maps'),
        ),
      ),
    );
  }

  // Function to open Google Maps
  _openGoogleMaps() async {
    // Replace the coordinates with the desired location
    final String latitude = '37.7749';  // Latitude of the location
    final String longitude = '-122.4194';  // Longitude of the location
    final String label = 'Googleplex';  // Name or label for the location

    // Construct the Google Maps URL
    final String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      // Handle error, for example, show an error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Could not launch Google Maps.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: GoogleMapsButton(),
  ));
}
*/
//////////otp//////
/*
const functions = require('firebase-functions');
const admin = require('firebase-admin');
const sgMail = require('@sendgrid/mail');

admin.initializeApp();

sgMail.setApiKey(functions.config().sendgrid.apikey);

exports.sendOTP = functions.https.onCall(async (data, context) => {
  const email = data.email;
  const otpCode = generateRandomOTP(); // Implement your OTP code generation logic here

  const msg = {
    to: email,
    from: 'your@email.com',
    subject: 'OTP Verification',
    text: `Your OTP code is: ${otpCode}`,
  };

  try {
    await sgMail.send(msg);
    return { success: true, message: 'OTP email sent successfully' };
  } catch (error) {
    return { success: false, message: 'Error sending OTP email' };
  }
});
*/
/*
import 'package:cloud_functions/cloud_functions.dart';

Future<void> sendOTP(String email) async {
  final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('sendOTP');
  try {
    final result = await callable({'email': email});
    print(result.data);
  } catch (e) {
    print('Error sending OTP: $e');
  }
}
*/
///////display days //////
/*
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Days of the Week with Dates'),
        ),
        body: DaysOfWeekList(),
      ),
    );
  }
}

class DaysOfWeekList extends StatelessWidget {
  final List<String> daysOfWeek = [
    'السبت',
    'الأحد',
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: daysOfWeek.length,
      itemBuilder: (BuildContext context, int index) {
        // Calculate the date for each day of the week
        final currentDate = DateTime.now();
        final dayToAdd = index-1 ;
        final dateForDay = currentDate.add(Duration(days: dayToAdd));

        // Format the date to display in a friendly format
        final formattedDate = DateFormat('dd').format(dateForDay);

        return Container(
          height: 80,
          color: Colors.lightBlueAccent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  daysOfWeek[index],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  formattedDate,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
*/