import 'package:workerbase_scanner/domain/repositories/qr_code.repository.dart';
import 'package:workerbase_scanner/domain/use_cases/abstract/use_case_abs.dart';

/// [DeleteQrCodeUseCase]
class DeleteQrCodeUseCase implements UseCaseWithParams<Future<void>, String> {
  final QrCodeRepository _qrCodeRepository;

  const DeleteQrCodeUseCase({
    required QrCodeRepository qrCodeRepository,
  }) : _qrCodeRepository = qrCodeRepository;

  @override
  Future<void> execute(String qrCode) async =>
      _qrCodeRepository.deleteQrCode(qrCode);
}
