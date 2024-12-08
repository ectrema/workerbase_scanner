// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_event.body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarEventLocalModel _$CalendarEventLocalModelFromJson(
        Map<String, dynamic> json) =>
    CalendarEventLocalModel(
      description: json['description'] as String?,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      location: json['location'] as String?,
      organizer: json['organizer'] as String?,
      status: json['status'] as String?,
      summary: json['summary'] as String?,
    );

Map<String, dynamic> _$CalendarEventLocalModelToJson(
        CalendarEventLocalModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'location': instance.location,
      'organizer': instance.organizer,
      'status': instance.status,
      'summary': instance.summary,
    };
