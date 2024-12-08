import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:workerbase_scanner/data/storages/body/contact_event.body.dart';

extension ContactInfoExtension on ContactInfo {
  ContactInfoLocalModel get toLocal => ContactInfoLocalModel(
        addresses: addresses.map((Address e) => e.toLocal).toList(),
        emails: emails.map((Email e) => e.toLocal).toList(),
        name: name?.toLocal,
        organization: organization,
        phones: phones.map((Phone e) => e.toLocal).toList(),
        title: title,
        urls: urls,
      );
}

extension ContactInfoLocalExtension on ContactInfoLocalModel {
  ContactInfo get toEntity => ContactInfo(
        addresses: addresses.map((AddressLocalModel e) => e.toEntity).toList(),
        emails: emails.map((EmailLocalModel e) => e.toEntity).toList(),
        name: name?.toEntity,
        organization: organization,
        phones: phones.map((PhoneLocalModel e) => e.toEntity).toList(),
        title: title,
        urls: urls,
      );
}

extension PersonNameExtension on PersonName {
  PersonNameLocalModel get toLocal => PersonNameLocalModel(
        first: first,
        middle: middle,
        last: last,
        prefix: prefix,
        suffix: suffix,
        formattedName: formattedName,
        pronunciation: pronunciation,
      );
}

extension PersonNameLocalExtension on PersonNameLocalModel {
  PersonName get toEntity => PersonName(
        first: first,
        middle: middle,
        last: last,
        prefix: prefix,
        suffix: suffix,
        formattedName: formattedName,
        pronunciation: pronunciation,
      );
}

extension AddressExtension on Address {
  AddressLocalModel get toLocal => AddressLocalModel(
        addressLines: addressLines,
        type: type,
      );
}

extension AddressLocalExtension on AddressLocalModel {
  Address get toEntity => Address(
        addressLines: addressLines,
        type: type,
      );
}

extension EmailExtension on Email {
  EmailLocalModel get toLocal => EmailLocalModel(
        address: address,
        body: body,
        subject: subject,
        type: type,
      );
}

extension EmailLocalExtension on EmailLocalModel {
  Email get toEntity => Email(
        address: address,
        body: body,
        subject: subject,
        type: type,
      );
}

extension PhoneExtension on Phone {
  PhoneLocalModel get toLocal => PhoneLocalModel(
        number: number,
        type: type,
      );
}

extension PhoneLocalExtension on PhoneLocalModel {
  Phone get toEntity => Phone(
        number: number,
        type: type,
      );
}
