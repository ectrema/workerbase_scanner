// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code.body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrCodeLocalModel _$QrCodeLocalModelFromJson(Map<String, dynamic> json) =>
    QrCodeLocalModel(
      qrCode: json['qr_code'] as String,
      date: json['date'] as String,
      type: (json['type'] as num).toInt(),
      format: (json['format'] as num).toInt(),
    );

Map<String, dynamic> _$QrCodeLocalModelToJson(QrCodeLocalModel instance) =>
    <String, dynamic>{
      'qr_code': instance.qrCode,
      'date': instance.date,
      'type': instance.type,
      'format': instance.format,
    };
