import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:workerbase_scanner/data/storages/body/calendar_event.body.dart';

extension CalendarEventExtension on CalendarEvent {
  CalendarEventLocalModel get toLocal => CalendarEventLocalModel(
        description: description,
        start: start,
        end: end,
        location: location,
        organizer: organizer,
        status: status,
        summary: summary,
      );
}

extension CalendarEventLocalExtension on CalendarEventLocalModel {
  CalendarEvent get toEntity => CalendarEvent(
        description: description,
        start: start,
        end: end,
        location: location,
        organizer: organizer,
        status: status,
        summary: summary,
      );
}
