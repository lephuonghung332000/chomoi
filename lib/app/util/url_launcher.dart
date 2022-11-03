import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<bool> openUrl(String url) async {
    try {
      return launchUrl(Uri.parse(url));
    } catch (_) {
      return false;
    }
  }
}
