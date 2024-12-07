// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:workerbase_scanner/core/providers/injections/data.module.dart'
    as _i1002;
import 'package:workerbase_scanner/core/providers/injections/domain.module.dart'
    as _i984;
import 'package:workerbase_scanner/data/data_sources/qr_code/local/qr_code.local.data_source.dart'
    as _i1040;
import 'package:workerbase_scanner/data/storages/qr_code.storage.dart' as _i438;
import 'package:workerbase_scanner/domain/repositories/qr_code.repository.dart'
    as _i1014;
import 'package:workerbase_scanner/domain/services/qr_code.service.dart'
    as _i585;
import 'package:workerbase_scanner/domain/use_cases/qr_code/delete_qr_code.use_case.dart'
    as _i202;
import 'package:workerbase_scanner/domain/use_cases/qr_code/get_qr_code.use_case.dart'
    as _i350;
import 'package:workerbase_scanner/domain/use_cases/qr_code/save_qr_code.use_case.dart'
    as _i38;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dataModule = _$DataModule();
    final domainModule = _$DomainModule();
    await gh.singletonAsync<_i438.QrCodeStorage>(
      () => dataModule.qrCodeStorage(),
      preResolve: true,
    );
    gh.singleton<_i1040.QrCodeLocalDataSource>(
        () => dataModule.qrCodeLocalDataSource(gh<_i438.QrCodeStorage>()));
    gh.singleton<_i1014.QrCodeRepository>(
        () => dataModule.qrCodeRepository(gh<_i1040.QrCodeLocalDataSource>()));
    gh.singleton<_i38.SaveQrCodeUseCase>(
        () => domainModule.saveQrCodeUseCase(gh<_i1014.QrCodeRepository>()));
    gh.singleton<_i202.DeleteQrCodeUseCase>(
        () => domainModule.deleteQrCodeUseCase(gh<_i1014.QrCodeRepository>()));
    gh.singleton<_i350.GetQrCodeUseCase>(
        () => domainModule.getQrCodeUseCase(gh<_i1014.QrCodeRepository>()));
    gh.singleton<_i585.QrCodeService>(() => domainModule.qrCodeService(
          gh<_i350.GetQrCodeUseCase>(),
          gh<_i202.DeleteQrCodeUseCase>(),
          gh<_i38.SaveQrCodeUseCase>(),
        ));
    return this;
  }
}

class _$DataModule extends _i1002.DataModule {}

class _$DomainModule extends _i984.DomainModule {}
