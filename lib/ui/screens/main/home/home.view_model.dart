import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:open_settings_plus/core/open_settings_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:workerbase_scanner/ui/screens/main/home/home.view_state.dart';

part 'home.view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  final MobileScannerController controller;

  StreamSubscription<Object?>? _subscription;

  factory HomeViewModel() {
    return HomeViewModel._();
  }

  HomeViewModel._()
      : controller = MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
          autoStart: false,
        );

  @override
  HomeState build() => HomeState.initial();

  Future<void> init() async {
    await controller.start();
    if (!controller.value.hasCameraPermission) {
      AppLifecycleListener(
        onResume: _onResume,
      );
    }

    _subscription = controller.barcodes.listen(onScan);
    state = state.copyWith(cameraEnabled: controller.value.hasCameraPermission);
  }

  void onScan(BarcodeCapture barcode) {}

  Future<void> requestCameraPermission() async {
    switch (OpenSettingsPlus.shared) {
      case OpenSettingsPlusAndroid settings:
        await settings.applicationDetails();
      case OpenSettingsPlusIOS settings:
        await settings.appSettings();
      default:
        throw Exception('Platform not supported');
    }
  }

  void _onResume() {
    if (controller.value.hasCameraPermission) {
      state =
          state.copyWith(cameraEnabled: controller.value.hasCameraPermission);
    }
  }

  void onDispose() {
    _subscription?.cancel();
    controller.dispose();
  }
}
