import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';

/// [QrCodeRepository]
abstract class QrCodeRepository {
  Future<void> saveQrCode(QrCodeEntity qrCode);

  Future<void> deleteQrCode(String qrCode);

  Future<List<QrCodeEntity>> getQrCodes();
}
