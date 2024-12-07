import 'package:injectable/injectable.dart';
import 'package:workerbase_scanner/data/data_sources/qr_code/local/impl/qr_code.local.data_source.impl.dart';
import 'package:workerbase_scanner/data/data_sources/qr_code/local/qr_code.local.data_source.dart';
import 'package:workerbase_scanner/data/repositories_impl/qr_code.repository.impl.dart';
import 'package:workerbase_scanner/data/storages/qr_code.storage.dart';
import 'package:workerbase_scanner/domain/repositories/qr_code.repository.dart';

/// Module to inject dependencies
@module
abstract class DataModule {
  @singleton
  @preResolve
  Future<QrCodeStorage> qrCodeStorage() => QrCodeStorage.inject();

  @Singleton(as: QrCodeLocalDataSource)
  QrCodeLocalDataSourceImpl qrCodeLocalDataSource(QrCodeStorage storage) =>
      QrCodeLocalDataSourceImpl(storage: storage);

  @Singleton(as: QrCodeRepository)
  QrCodeRepositoryImpl qrCodeRepository(
    QrCodeLocalDataSource localDataSource,
  ) =>
      QrCodeRepositoryImpl(localDataSource: localDataSource);
}
