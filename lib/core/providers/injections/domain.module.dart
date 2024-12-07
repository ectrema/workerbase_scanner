import 'package:injectable/injectable.dart';
import 'package:workerbase_scanner/domain/repositories/qr_code.repository.dart';
import 'package:workerbase_scanner/domain/services/qr_code.service.dart';
import 'package:workerbase_scanner/domain/use_cases/qr_code/delete_qr_code.use_case.dart';
import 'package:workerbase_scanner/domain/use_cases/qr_code/get_qr_code.use_case.dart';
import 'package:workerbase_scanner/domain/use_cases/qr_code/save_qr_code.use_case.dart';

/// Module to inject dependencies
@module
abstract class DomainModule {
  @singleton
  SaveQrCodeUseCase saveQrCodeUseCase(QrCodeRepository qrCodeRepository) =>
      SaveQrCodeUseCase(qrCodeRepository: qrCodeRepository);

  @singleton
  DeleteQrCodeUseCase deleteQrCodeUseCase(QrCodeRepository qrCodeRepository) =>
      DeleteQrCodeUseCase(qrCodeRepository: qrCodeRepository);

  @singleton
  GetQrCodeUseCase getQrCodeUseCase(QrCodeRepository qrCodeRepository) =>
      GetQrCodeUseCase(qrCodeRepository: qrCodeRepository);

  @singleton
  QrCodeService qrCodeService(
    GetQrCodeUseCase getQrCodeUseCase,
    DeleteQrCodeUseCase deleteQrCodeUseCase,
    SaveQrCodeUseCase saveQrCodeUseCase,
  ) =>
      QrCodeService(
        getQrCodeUseCase: getQrCodeUseCase,
        deleteQrCodeUseCase: deleteQrCodeUseCase,
        saveQrCodeUseCase: saveQrCodeUseCase,
      );
}
