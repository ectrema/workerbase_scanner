import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';
import 'package:workerbase_scanner/domain/repositories/qr_code.repository.dart';
import 'package:workerbase_scanner/domain/use_cases/abstract/use_case_abs.dart';

/// [GetQrCodeUseCase]
class GetQrCodeUseCase implements UseCase<Future<List<QrCodeEntity>>> {
  final QrCodeRepository _qrCodeRepository;

  const GetQrCodeUseCase({
    required QrCodeRepository qrCodeRepository,
  }) : _qrCodeRepository = qrCodeRepository;

  @override
  Future<List<QrCodeEntity>> execute() async => _qrCodeRepository.getQrCodes();
}
