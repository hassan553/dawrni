// make sure to send url with "https://"

import 'package:dawrni/core/core_compoent/show_toast.dart';
import 'package:url_launcher/url_launcher.dart';

class AppLauncher {
  static AppLauncher? _instance;
  AppLauncher._();
  factory AppLauncher() => _instance ??= AppLauncher._();

  // Sends an email using the provided domain and message
  Future<void> sendEmail(String domin, String message) async {
    // Helper function to encode query parameters for the email URI
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    // Create the email URI with the provided domain and message
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: domin,
      query: encodeQueryParameters(<String, String>{
        'subject': message,
      }),
    );

    // Launch the email app with the email URI
    await launchUrl(emailLaunchUri);
  }

  // Launches a URI using the URL launcher
  Future<void> uriLauncher(Uri uri) async {
    try {
      // Launch the URI, checking if an external application is used
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception();
      }
    } catch (e) {
      // Show a toast message for any unexpected errors
      showToast(message: "Unexpected Error");
    }
  }

  // Makes a phone call using the provided phone number
  Future<void> makePhoneCall(String phoneNumber) async {
    // Create the phone call URI with the provided phone number
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    // Launch the phone call app with the phone call URI
    await launchUrl(launchUri);
  }
}
