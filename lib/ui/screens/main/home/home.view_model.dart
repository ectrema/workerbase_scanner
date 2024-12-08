import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:open_settings_plus/core/open_settings_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:workerbase_scanner/core/providers/initializer.dart';
import 'package:workerbase_scanner/core/routing/app_router.dart';
import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';
import 'package:workerbase_scanner/domain/services/qr_code.service.dart';
import 'package:workerbase_scanner/ui/screens/main/home/home.view_state.dart';

part 'home.view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  final MobileScannerController controller;

  StreamSubscription<Object?>? _subscription;

  final QrCodeService _qrCodeService;

  factory HomeViewModel() {
    return HomeViewModel._(
      qrCodeService: injector<QrCodeService>(),
    );
  }

  HomeViewModel._({
    required QrCodeService qrCodeService,
  })  : _qrCodeService = qrCodeService,
        controller = MobileScannerController(
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

    _subscription = controller.barcodes.listen(_onScan);
    state = state.copyWith(cameraEnabled: controller.value.hasCameraPermission);
  }

  Future<void> _onScan(BarcodeCapture barcode) async {
    if (barcode.barcodes.isEmpty) return;
    final Barcode scannedBarcode = barcode.barcodes.first;

    if (scannedBarcode.rawValue == null) return;

    final QrCodeEntity qrCode = QrCodeEntity(
      qrCode: scannedBarcode.rawValue!,
      date: DateTime.now(),
      type: scannedBarcode.type,
      format: scannedBarcode.format,
      calendarEvent: scannedBarcode.calendarEvent,
      contactInfo: scannedBarcode.contactInfo,
    );

    await _qrCodeService.saveQrCode(qrCode);
    await controller.stop();
    await router.push(
      RouterEnum.scanDetail.navigation,
      extra: qrCode,
    );
    await controller.start();
  }

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

  Future<void> stopCamera() async {
    await controller.stop();
  }

  Future<void> startCamera() async {
    await controller.start();
  }
}
