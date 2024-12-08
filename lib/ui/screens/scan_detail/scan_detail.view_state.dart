import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';
import 'package:workerbase_scanner/ui/abstraction/view_state_abs.dart';

part 'scan_detail.view_state.g.dart';

@CopyWith()
class ScanDetailState extends ViewStateAbs {
  final QrCodeEntity? qrCode;

  final bool isLink;

  const ScanDetailState({
    required this.qrCode,
    required this.isLink,
  }) : super();

  ScanDetailState.initial()
      : qrCode = null,
        isLink = false;

  @override
  List<Object?> get props => <Object?>[qrCode];
}
