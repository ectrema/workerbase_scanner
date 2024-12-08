// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_event.body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactInfoLocalModel _$ContactInfoLocalModelFromJson(
        Map<String, dynamic> json) =>
    ContactInfoLocalModel(
      addresses: (json['addresses'] as List<dynamic>)
          .map((e) => AddressLocalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      emails: (json['emails'] as List<dynamic>)
          .map((e) => EmailLocalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] == null
          ? null
          : PersonNameLocalModel.fromJson(json['name'] as Map<String, dynamic>),
      organization: json['organization'] as String?,
      phones: (json['phones'] as List<dynamic>)
          .map((e) => PhoneLocalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      urls: (json['urls'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ContactInfoLocalModelToJson(
        ContactInfoLocalModel instance) =>
    <String, dynamic>{
      'addresses': instance.addresses,
      'emails': instance.emails,
      'name': instance.name,
      'organization': instance.organization,
      'phones': instance.phones,
      'title': instance.title,
      'urls': instance.urls,
    };

PhoneLocalModel _$PhoneLocalModelFromJson(Map<String, dynamic> json) =>
    PhoneLocalModel(
      number: json['number'] as String?,
      type: $enumDecodeNullable(_$PhoneTypeEnumMap, json['type']) ??
          PhoneType.unknown,
    );

Map<String, dynamic> _$PhoneLocalModelToJson(PhoneLocalModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'type': _$PhoneTypeEnumMap[instance.type]!,
    };

const _$PhoneTypeEnumMap = {
  PhoneType.unknown: 'unknown',
  PhoneType.work: 'work',
  PhoneType.home: 'home',
  PhoneType.fax: 'fax',
  PhoneType.mobile: 'mobile',
};

AddressLocalModel _$AddressLocalModelFromJson(Map<String, dynamic> json) =>
    AddressLocalModel(
      addressLines: (json['address_lines'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      type: $enumDecodeNullable(_$AddressTypeEnumMap, json['type']) ??
          AddressType.unknown,
    );

Map<String, dynamic> _$AddressLocalModelToJson(AddressLocalModel instance) =>
    <String, dynamic>{
      'address_lines': instance.addressLines,
      'type': _$AddressTypeEnumMap[instance.type]!,
    };

const _$AddressTypeEnumMap = {
  AddressType.unknown: 'unknown',
  AddressType.work: 'work',
  AddressType.home: 'home',
};

EmailLocalModel _$EmailLocalModelFromJson(Map<String, dynamic> json) =>
    EmailLocalModel(
      address: json['address'] as String?,
      body: json['body'] as String?,
      subject: json['subject'] as String?,
      type: $enumDecodeNullable(_$EmailTypeEnumMap, json['type']) ??
          EmailType.unknown,
    );

Map<String, dynamic> _$EmailLocalModelToJson(EmailLocalModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'body': instance.body,
      'subject': instance.subject,
      'type': _$EmailTypeEnumMap[instance.type]!,
    };

const _$EmailTypeEnumMap = {
  EmailType.unknown: 'unknown',
  EmailType.work: 'work',
  EmailType.home: 'home',
};

PersonNameLocalModel _$PersonNameLocalModelFromJson(
        Map<String, dynamic> json) =>
    PersonNameLocalModel(
      first: json['first'] as String?,
      middle: json['middle'] as String?,
      last: json['last'] as String?,
      prefix: json['prefix'] as String?,
      suffix: json['suffix'] as String?,
      formattedName: json['formatted_name'] as String?,
      pronunciation: json['pronunciation'] as String?,
    );

Map<String, dynamic> _$PersonNameLocalModelToJson(
        PersonNameLocalModel instance) =>
    <String, dynamic>{
      'first': instance.first,
      'middle': instance.middle,
      'last': instance.last,
      'prefix': instance.prefix,
      'suffix': instance.suffix,
      'formatted_name': instance.formattedName,
      'pronunciation': instance.pronunciation,
    };
