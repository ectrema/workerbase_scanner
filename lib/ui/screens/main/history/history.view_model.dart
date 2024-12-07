import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:workerbase_scanner/core/providers/initializer.dart';
import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';
import 'package:workerbase_scanner/domain/services/qr_code.service.dart';
import 'package:workerbase_scanner/ui/screens/main/history/history.view_state.dart';

part 'history.view_model.g.dart';

/// [HistoryViewModel]
@riverpod
class HistoryViewModel extends _$HistoryViewModel {
  final QrCodeService _qrCodeService;

  factory HistoryViewModel() {
    return HistoryViewModel._(
      qrCodeService: injector<QrCodeService>(),
    );
  }

  HistoryViewModel._({
    required QrCodeService qrCodeService,
  }) : _qrCodeService = qrCodeService {
    _init();
  }

  @override
  HistoryState build() =>
      HistoryState.initial(_qrCodeService.savedQrCodes.value);

  void _init() {
    _qrCodeService.savedQrCodes.addListener(() {
      state = state.copyWith(savedQrCodes: _qrCodeService.savedQrCodes.value);
    });
  }

  void deleteQrCode(QrCodeEntity qrCode) {
    _qrCodeService.deleteQrCode(qrCode.qrCode);
  }
}
