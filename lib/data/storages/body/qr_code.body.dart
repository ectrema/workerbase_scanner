import 'package:json_annotation/json_annotation.dart';
import 'package:workerbase_scanner/core/mixins/serializable.mixin.dart';
import 'package:workerbase_scanner/data/storages/body/calendar_event.body.dart';

part 'qr_code.body.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class QrCodeLocalModel with SerializableMixin {
  final String qrCode;

  final String date;

  final int type;

  final int format;

  final CalendarEventLocalModel? calendarEvent;

  QrCodeLocalModel({
    required this.qrCode,
    required this.date,
    required this.type,
    required this.format,
    this.calendarEvent,
  });

  static QrCodeLocalModel fromJson(Map<String, dynamic> json) =>
      _$QrCodeLocalModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$QrCodeLocalModelToJson(this);
}
