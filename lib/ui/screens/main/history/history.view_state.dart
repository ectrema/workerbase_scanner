import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';
import 'package:workerbase_scanner/ui/abstraction/view_state_abs.dart';

part 'history.view_state.g.dart';

@CopyWith()
class HistoryState extends ViewStateAbs {
  final List<QrCodeEntity> savedQrCodes;

  const HistoryState({required this.savedQrCodes}) : super();

  HistoryState.initial(this.savedQrCodes) : super();

  @override
  List<Object?> get props => <Object?>[savedQrCodes];
}
