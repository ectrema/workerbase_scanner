import 'package:equatable/equatable.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:workerbase_scanner/data/storages/body/qr_code.body.dart';
import 'package:workerbase_scanner/domain/entities/extensions/calendar.extension.dart';
import 'package:workerbase_scanner/domain/entities/extensions/contact.extension.dart';

export 'extensions/qr_code.extension.dart';

final class QrCodeEntity with EquatableMixin {
  final String qrCode;

  final DateTime date;

  final BarcodeType type;

  final BarcodeFormat format;

  final CalendarEvent? calendarEvent;

  final ContactInfo? contactInfo;

  QrCodeEntity({
    required this.qrCode,
    required this.date,
    required this.type,
    required this.format,
    this.calendarEvent,
    this.contactInfo,
  });

  factory QrCodeEntity.fromLocal(
    QrCodeLocalModel localModel,
  ) {
    return QrCodeEntity(
      qrCode: localModel.qrCode,
      date: DateTime.parse(localModel.date),
      type: BarcodeType.fromRawValue(localModel.type),
      format: BarcodeFormat.fromRawValue(localModel.format),
      calendarEvent: localModel.calendarEvent?.toEntity,
      contactInfo: localModel.contactInfo?.toEntity,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        qrCode,
        date,
        type,
        format,
        calendarEvent,
        contactInfo,
      ];
}
