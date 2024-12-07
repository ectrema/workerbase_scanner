import 'package:workerbase_scanner/data/storages/body/qr_code.body.dart';

/// [QrCodeLocalDataSource]
abstract class QrCodeLocalDataSource {
  Future<void> saveQrCode(QrCodeLocalModel qrCode);

  Future<void> deleteQrCode(String qrCode);

  Future<List<QrCodeLocalModel>> getQrCodes();
}
