// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "home": "Home",
  "history": "History",
  "cameraPermissionNotGranted": "Camera permission not granted, click here to request access",
  "qrCodeScanner": "QRCode Scanner",
  "scanDetail": "Scan Detail",
  "copyToClipboard": "Copy to clipboard",
  "openTheLink": "Open the link",
  "copiedToClipboard": "Copied to clipboard",
  "historyIsEmpty": "Your history is empty, scan something!",
  "typeOfQrCode": "Type of QR Code : {}",
  "formatOfQrCode": "Format of QR Code : {}",
  "anErrorOccurred": "An error occurred : {}",
  "addEventToCalendar": "Add event to calendar"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
