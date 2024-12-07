import 'package:json_annotation/json_annotation.dart';
import 'package:workerbase_scanner/core/mixins/serializable.mixin.dart';

part 'qr_code.body.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class QrCodeLocalModel with SerializableMixin {
  final String qrCode;

  final String date;

  QrCodeLocalModel({
    required this.qrCode,
    required this.date,
  });

  static QrCodeLocalModel fromJson(Map<String, dynamic> json) =>
      _$QrCodeLocalModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$QrCodeLocalModelToJson(this);
}
