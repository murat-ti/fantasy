import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initGoogleMobileAds();

  runApp(const FantasyApp());
}

Future<InitializationStatus> _initGoogleMobileAds() {
  return MobileAds.instance.initialize();
}