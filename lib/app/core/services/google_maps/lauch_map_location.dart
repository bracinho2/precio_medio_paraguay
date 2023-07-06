import 'package:url_launcher/url_launcher.dart';

abstract class MapLocationService {
  Future<void> lauchMapOnBrowser(
      {required String latitude, required String longitude});
}

class GoogleMapsLocationService implements MapLocationService {
  @override
  Future<void> lauchMapOnBrowser(
      {required String latitude, required String longitude}) async {
    final urlMap =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    if (await canLaunchUrl(Uri.parse(urlMap))) {
      await launchUrl(Uri.parse(urlMap));
    } else {
      throw 'Could not launch Maps';
    }
  }
}
