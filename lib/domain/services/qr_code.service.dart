import 'package:flutter/foundation.dart';
import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';
import 'package:workerbase_scanner/domain/use_cases/qr_code/delete_qr_code.use_case.dart';
import 'package:workerbase_scanner/domain/use_cases/qr_code/get_qr_code.use_case.dart';
import 'package:workerbase_scanner/domain/use_cases/qr_code/save_qr_code.use_case.dart';

final class QrCodeService {
  final GetQrCodeUseCase _getQrCodeUseCase;

  final DeleteQrCodeUseCase _deleteQrCodeUseCase;

  final SaveQrCodeUseCase _saveQrCodeUseCase;

  ValueNotifier<List<QrCodeEntity>> savedQrCodes;

  QrCodeService({
    required GetQrCodeUseCase getQrCodeUseCase,
    required DeleteQrCodeUseCase deleteQrCodeUseCase,
    required SaveQrCodeUseCase saveQrCodeUseCase,
  })  : _getQrCodeUseCase = getQrCodeUseCase,
        _deleteQrCodeUseCase = deleteQrCodeUseCase,
        _saveQrCodeUseCase = saveQrCodeUseCase,
        savedQrCodes = ValueNotifier<List<QrCodeEntity>>(<QrCodeEntity>[]) {
    _init();
  }

  Future<void> _init() async {
    savedQrCodes.value = await _getQrCodeUseCase.execute();
  }

  Future<void> saveQrCode(QrCodeEntity qrCode) async {
    await _saveQrCodeUseCase.execute(qrCode);
    savedQrCodes.value = await _getQrCodeUseCase.execute();
  }

  Future<void> deleteQrCode(String qrCode) async {
    await _deleteQrCodeUseCase.execute(qrCode);
    savedQrCodes.value = await _getQrCodeUseCase.execute();
  }
}
