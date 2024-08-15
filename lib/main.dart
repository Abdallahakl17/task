 
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:itlala/app.dart';
import 'package:itlala/core/network/api_helper.dart';
import 'package:itlala/presentation/imports.dart';
 
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiHelper.init();
  runApp( 
     DevicePreview(
      enabled: !kReleaseMode, // Enable DevicePreview only in non-release mode
      builder: (context) => MyApp(),
     
    
  ));
}
