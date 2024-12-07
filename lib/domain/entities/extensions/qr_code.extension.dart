import 'package:workerbase_scanner/data/storages/body/qr_code.body.dart';
import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';

extension QrCodeEntityExtension on QrCodeEntity {
  QrCodeLocalModel get toLocal => QrCodeLocalModel(
        qrCode: qrCode,
        date: date.toIso8601String(),
      );
}
