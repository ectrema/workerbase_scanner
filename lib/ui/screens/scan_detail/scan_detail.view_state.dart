import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
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

extension OnScanDetailState on ScanDetailState {
  bool get hasCalendarEvent => qrCode?.type == BarcodeType.calendarEvent;

  bool get hasContactInfo => qrCode?.type == BarcodeType.contactInfo;

  bool get hasAction => isLink || hasCalendarEvent || hasContactInfo;
}
