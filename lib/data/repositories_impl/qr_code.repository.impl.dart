import 'package:workerbase_scanner/data/data_sources/qr_code/local/qr_code.local.data_source.dart';
import 'package:workerbase_scanner/data/storages/body/qr_code.body.dart';
import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';
import 'package:workerbase_scanner/domain/repositories/qr_code.repository.dart';

final class QrCodeRepositoryImpl implements QrCodeRepository {
  final QrCodeLocalDataSource _localDataSource;

  const QrCodeRepositoryImpl({
    required QrCodeLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  @override
  Future<void> saveQrCode(QrCodeEntity qrCode) async =>
      _localDataSource.saveQrCode(qrCode.toLocal);

  @override
  Future<void> deleteQrCode(String qrCode) async =>
      _localDataSource.deleteQrCode(qrCode);

  @override
  Future<List<QrCodeEntity>> getQrCodes() async {
    final List<QrCodeLocalModel> localModels =
        await _localDataSource.getQrCodes();

    return localModels.map(QrCodeEntity.fromLocal).toList();
  }
}
