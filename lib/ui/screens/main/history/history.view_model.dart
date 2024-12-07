import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:workerbase_scanner/ui/screens/main/history/history.view_state.dart';

part 'history.view_model.g.dart';

///
/// [HistoryViewModel]
///
@riverpod
class HistoryViewModel extends _$HistoryViewModel {
  factory HistoryViewModel() {
    return HistoryViewModel._();
  }

  HistoryViewModel._();

  @override
  HistoryState build() => HistoryState.initial();
}
