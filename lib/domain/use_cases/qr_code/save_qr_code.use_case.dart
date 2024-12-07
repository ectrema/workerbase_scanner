import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';
import 'package:workerbase_scanner/domain/repositories/qr_code.repository.dart';
import 'package:workerbase_scanner/domain/use_cases/abstract/use_case_abs.dart';

/// [SaveQrCodeUseCase]
class SaveQrCodeUseCase
    implements UseCaseWithParams<Future<void>, QrCodeEntity> {
  final QrCodeRepository _qrCodeRepository;

  const SaveQrCodeUseCase({
    required QrCodeRepository qrCodeRepository,
  }) : _qrCodeRepository = qrCodeRepository;

  @override
  Future<void> execute(QrCodeEntity qrCode) async {
    return _qrCodeRepository.saveQrCode(qrCode);
  }
}
