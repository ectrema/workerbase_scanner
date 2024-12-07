import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:workerbase_scanner/ui/screens/scan_detail/scan_detail.view_state.dart';

part 'scan_detail.view_model.g.dart';

///
/// [ScanDetailViewModel]
///
@riverpod
class ScanDetailViewModel extends _$ScanDetailViewModel {
  factory ScanDetailViewModel() {
    return ScanDetailViewModel._();
  }

  ScanDetailViewModel._();

  @override
  ScanDetailState build() => ScanDetailState.initial();

  Future<void> init(String qrCode) async {
    state = state.copyWith(qrCode: qrCode);
  }
}
