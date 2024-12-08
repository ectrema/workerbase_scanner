import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:workerbase_scanner/core/mixins/serializable.mixin.dart';

part 'contact_event.body.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ContactInfoLocalModel with SerializableMixin {
  final List<AddressLocalModel> addresses;

  final List<EmailLocalModel> emails;

  final PersonNameLocalModel? name;

  final String? organization;

  final List<PhoneLocalModel> phones;

  final String? title;

  final List<String> urls;

  ContactInfoLocalModel({
    required this.addresses,
    required this.emails,
    this.name,
    this.organization,
    required this.phones,
    this.title,
    required this.urls,
  });

  static ContactInfoLocalModel fromJson(Map<String, dynamic> json) =>
      _$ContactInfoLocalModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ContactInfoLocalModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PhoneLocalModel with SerializableMixin {
  const PhoneLocalModel({
    this.number,
    this.type = PhoneType.unknown,
  });

  final String? number;

  final PhoneType type;

  static PhoneLocalModel fromJson(Map<String, dynamic> json) =>
      _$PhoneLocalModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PhoneLocalModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AddressLocalModel with SerializableMixin {
  const AddressLocalModel({
    this.addressLines = const <String>[],
    this.type = AddressType.unknown,
  });

  final List<String> addressLines;

  final AddressType type;

  static AddressLocalModel fromJson(Map<String, dynamic> json) =>
      _$AddressLocalModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AddressLocalModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class EmailLocalModel with SerializableMixin {
  /// Construct a new [Email] instance.
  const EmailLocalModel({
    this.address,
    this.body,
    this.subject,
    this.type = EmailType.unknown,
  });

  final String? address;

  final String? body;

  final String? subject;

  final EmailType type;

  static EmailLocalModel fromJson(Map<String, dynamic> json) =>
      _$EmailLocalModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EmailLocalModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PersonNameLocalModel with SerializableMixin {
  const PersonNameLocalModel({
    this.first,
    this.middle,
    this.last,
    this.prefix,
    this.suffix,
    this.formattedName,
    this.pronunciation,
  });

  final String? first;

  final String? middle;

  final String? last;

  final String? prefix;

  final String? suffix;

  final String? formattedName;

  final String? pronunciation;

  static PersonNameLocalModel fromJson(Map<String, dynamic> json) =>
      _$PersonNameLocalModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PersonNameLocalModelToJson(this);
}
