import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<bool> openUrl(String url) async {
    try {
      return launchUrl(Uri.parse(url));
    } catch (_) {
      return false;
    }
  }

  static Future<bool> callToPhone(String phoneNumber) async {
    if (phoneNumber.isEmpty) {
      return false;
    }

    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    return launchUrl(phoneLaunchUri);
  }

  static Future<bool> composeSms(String phoneNumber) async {
    if (phoneNumber.isEmpty) {
      return false;
    }

    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );

    return launchUrl(smsLaunchUri);
  }
}
