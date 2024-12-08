import 'package:json_annotation/json_annotation.dart';
import 'package:workerbase_scanner/core/mixins/serializable.mixin.dart';

part 'calendar_event.body.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CalendarEventLocalModel with SerializableMixin {
  final String? description;

  final DateTime? start;

  final DateTime? end;

  final String? location;

  final String? organizer;

  final String? status;

  final String? summary;

  CalendarEventLocalModel({
    this.description,
    this.start,
    this.end,
    this.location,
    this.organizer,
    this.status,
    this.summary,
  });

  static CalendarEventLocalModel fromJson(Map<String, dynamic> json) =>
      _$CalendarEventLocalModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CalendarEventLocalModelToJson(this);
}
