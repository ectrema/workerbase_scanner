import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';
import 'package:workerbase_scanner/ui/screens/scan_detail/scan_detail.view_state.dart';

part 'scan_detail.view_model.g.dart';

/// [ScanDetailViewModel]
@riverpod
class ScanDetailViewModel extends _$ScanDetailViewModel {
  factory ScanDetailViewModel() {
    return ScanDetailViewModel._();
  }

  ScanDetailViewModel._();

  @override
  ScanDetailState build() => ScanDetailState.initial();

  Future<void> init(QrCodeEntity qrCode) async {
    state = state.copyWith(
      qrCode: qrCode,
      isLink: await canLaunchUrl(Uri.parse(qrCode.qrCode)),
    );
  }

  Future<void> onActionTap() async {
    if (state.qrCode == null) return;

    switch (state.qrCode!.type) {
      case BarcodeType.email:
        await launchUrl(Uri.parse('mailto:${state.qrCode!.qrCode}'));
        break;
      case BarcodeType.phone:
        await launchUrl(Uri.parse('tel:${state.qrCode!.qrCode}'));
        break;
      case BarcodeType.sms:
        await launchUrl(Uri.parse('sms:${state.qrCode!.qrCode}'));
        break;
      case BarcodeType.calendarEvent:
        if (state.qrCode!.calendarEvent == null) return;

        final Event event = Event(
          title: state.qrCode!.calendarEvent!.summary ?? '',
          description: state.qrCode!.calendarEvent!.description,
          location: state.qrCode!.calendarEvent!.location,
          startDate: state.qrCode!.calendarEvent!.start ?? DateTime.now(),
          endDate: state.qrCode!.calendarEvent!.end ?? DateTime.now(),
        );
        await Add2Calendar.addEvent2Cal(event);
        break;
      default:
        await launchUrl(Uri.parse(state.qrCode!.qrCode));
    }
  }
}
