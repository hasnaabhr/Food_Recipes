import 'package:url_launcher/url_launcher.dart';

class StartCooking {
  static Future<void> startCooking(String url) async {
    final recipe = Uri.parse(url);
    if (!await launchUrl(recipe)) {
      throw Exception('Could not launch');
    }
  }
}
