import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:workerbase_scanner/data/storages/body/calendar_event.body.dart';
import 'package:workerbase_scanner/data/storages/body/contact_event.body.dart';
import 'package:workerbase_scanner/data/storages/body/qr_code.body.dart';
import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';

void main() {
  group('QrCodeEntity', () {
    final DateTime testDate = DateTime(2024);
    final QrCodeEntity testEntity = QrCodeEntity(
      qrCode: 'test code',
      date: testDate,
      type: BarcodeType.text,
      format: BarcodeFormat.qrCode,
    );

    test('creates instance with required parameters', () {
      expect(testEntity.qrCode, equals('test code'));
      expect(testEntity.date, equals(testDate));
      expect(testEntity.type, equals(BarcodeType.text));
      expect(testEntity.format, equals(BarcodeFormat.qrCode));
      expect(testEntity.calendarEvent, isNull);
      expect(testEntity.contactInfo, isNull);
    });

    test('creates instance from local model', () {
      final QrCodeLocalModel localModel = QrCodeLocalModel(
        qrCode: 'test code',
        date: testDate.toIso8601String(),
        type: BarcodeType.text.rawValue,
        format: BarcodeFormat.qrCode.rawValue,
      );

      final QrCodeEntity entity = QrCodeEntity.fromLocal(localModel);

      expect(entity.qrCode, equals(localModel.qrCode));
      expect(entity.date, equals(testDate));
      expect(entity.type, equals(BarcodeType.text));
      expect(entity.format, equals(BarcodeFormat.qrCode));
    });

    test('creates instance from local model with calendar event', () {
      final QrCodeLocalModel localModel = QrCodeLocalModel(
        qrCode: 'test code',
        date: testDate.toIso8601String(),
        type: BarcodeType.text.rawValue,
        format: BarcodeFormat.qrCode.rawValue,
        calendarEvent: CalendarEventLocalModel(
          summary: 'test title',
          description: 'test description',
          start: testDate,
          end: testDate,
          location: 'test location',
        ),
      );

      final QrCodeEntity entity = QrCodeEntity.fromLocal(localModel);

      expect(entity.qrCode, equals(localModel.qrCode));
      expect(entity.date, equals(testDate));
      expect(entity.type, equals(BarcodeType.text));
      expect(entity.format, equals(BarcodeFormat.qrCode));
      expect(entity.calendarEvent, isNotNull);
      expect(
        entity.calendarEvent!.description,
        equals(localModel.calendarEvent?.description),
      );
      expect(
        entity.calendarEvent!.summary,
        equals(localModel.calendarEvent?.summary),
      );
      expect(
        entity.calendarEvent!.location,
        equals(localModel.calendarEvent?.location),
      );
      expect(
        entity.calendarEvent!.start,
        equals(localModel.calendarEvent?.start),
      );
      expect(
        entity.calendarEvent!.end,
        equals(localModel.calendarEvent?.end),
      );
      expect(entity.contactInfo, isNull);
    });
    test('creates instance from local model with contact info', () {
      final QrCodeLocalModel localModel = QrCodeLocalModel(
        qrCode: 'test code',
        date: testDate.toIso8601String(),
        type: BarcodeType.text.rawValue,
        format: BarcodeFormat.qrCode.rawValue,
        contactInfo: ContactInfoLocalModel(
          name: PersonNameLocalModel(
            first: 'test first name',
            last: 'test last name',
          ),
          emails: <EmailLocalModel>[
            EmailLocalModel(address: 'test email'),
          ],
          phones: <PhoneLocalModel>[
            PhoneLocalModel(number: 'test phone'),
          ],
          urls: <String>['test url'],
          addresses: <AddressLocalModel>[
            AddressLocalModel(
              addressLines: <String>['test address'],
            ),
          ],
        ),
      );

      final QrCodeEntity entity = QrCodeEntity.fromLocal(localModel);

      expect(entity.qrCode, equals(localModel.qrCode));
      expect(entity.date, equals(testDate));
      expect(entity.type, equals(BarcodeType.text));
      expect(entity.format, equals(BarcodeFormat.qrCode));
      expect(entity.calendarEvent, isNull);
      expect(entity.contactInfo!.name!.first, isNotNull);
      expect(
        entity.contactInfo!.name!.last,
        equals(localModel.contactInfo?.name?.last),
      );
      expect(
        entity.contactInfo!.emails.first.address,
        equals(localModel.contactInfo?.emails.first.address),
      );
      expect(
        entity.contactInfo!.phones.first.number,
        equals(localModel.contactInfo?.phones.first.number),
      );
      expect(
        entity.contactInfo!.urls.first,
        equals(localModel.contactInfo?.urls.first),
      );
      expect(
        entity.contactInfo!.addresses.first.addressLines.first,
        equals(localModel.contactInfo?.addresses.first.addressLines.first),
      );
    });

    test('implements value equality', () {
      final QrCodeEntity entity1 = QrCodeEntity(
        qrCode: 'test code',
        date: testDate,
        type: BarcodeType.text,
        format: BarcodeFormat.qrCode,
      );

      final QrCodeEntity entity2 = QrCodeEntity(
        qrCode: 'test code',
        date: testDate,
        type: BarcodeType.text,
        format: BarcodeFormat.qrCode,
      );

      expect(entity1, equals(entity2));
    });
  });
}
