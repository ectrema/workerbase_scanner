import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart' as contacts;
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workerbase_scanner/core/localizations/localizations.dart';
import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';
import 'package:workerbase_scanner/ui/screens/scan_detail/scan_detail.view_state.dart';

part 'scan_detail.view_model.g.dart';

/// [ScanDetailViewModel]
@riverpod
class ScanDetailViewModel extends _$ScanDetailViewModel {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
      case BarcodeType.contactInfo:
        if (state.qrCode!.contactInfo == null) return;

        final ContactInfo info = state.qrCode!.contactInfo!;

        final contacts.Contact newContact = contacts.Contact(
          name: contacts.Name(
            first: info.name?.first ?? '',
            middle: info.name?.middle ?? '',
            last: info.name?.last ?? '',
            prefix: info.name?.prefix ?? '',
            suffix: info.name?.suffix ?? '',
          ),
          emails: info.emails
              .map((Email e) => contacts.Email(e.address ?? ''))
              .toList(),
          phones: info.phones
              .map((Phone e) => contacts.Phone(e.number ?? ''))
              .toList(),
          addresses: info.addresses
              .map((Address e) => contacts.Address(e.addressLines.first))
              .toList(),
          websites: info.urls.map(contacts.Website.new).toList(),
        );
        await newContact.insert();
        if (scaffoldKey.currentContext != null) {
          ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
            SnackBar(
              content: Text(LocaleKeys.addedContact.tr()),
            ),
          );
        }
      default:
        await launchUrl(Uri.parse(state.qrCode!.qrCode));
    }
  }
}
