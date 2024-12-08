import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workerbase_scanner/core/localizations/localizations.dart';
import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';
import 'package:workerbase_scanner/ui/screens/main/history/history.screen.dart';
import 'package:workerbase_scanner/ui/screens/main/history/history.view_model.dart';
import 'package:workerbase_scanner/ui/screens/main/history/history.view_state.dart';

class EmptyMockHistoryViewModel extends AutoDisposeNotifier<HistoryState>
    with Mock
    implements HistoryViewModel {
  @override
  HistoryState build() => HistoryState.initial(<QrCodeEntity>[]);
}

class MockHistoryViewModel extends AutoDisposeNotifier<HistoryState>
    with Mock
    implements HistoryViewModel {
  @override
  HistoryState build() => HistoryState.initial(<QrCodeEntity>[
        QrCodeEntity(
          qrCode: 'test code',
          date: DateTime(2024),
          type: BarcodeType.text,
          format: BarcodeFormat.qrCode,
        ),
      ]);
}

void main() {
  late final MockHistoryViewModel mockViewModel;
  late final EmptyMockHistoryViewModel emptyMockViewModel;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues(<String, Object>{});
    await EasyLocalization.ensureInitialized();
  });

  group('HistoryScreen', () {
    testWidgets('shows empty state when no QR codes',
        (WidgetTester tester) async {
      emptyMockViewModel = EmptyMockHistoryViewModel();

      await tester.pumpWidget(
        ProviderScope(
          overrides: <Override>[
            historyViewModelProvider.overrideWith(() => emptyMockViewModel),
          ],
          child: const MaterialApp(
            home: HistoryScreen(),
          ),
        ),
      );

      expect(find.text(LocaleKeys.historyIsEmpty.tr()), findsOneWidget);
      expect(find.byIcon(Icons.delete), findsNothing);
    });

    testWidgets('shows list of QR codes when available',
        (WidgetTester tester) async {
      mockViewModel = MockHistoryViewModel();
      await tester.pumpWidget(
        ProviderScope(
          overrides: <Override>[
            historyViewModelProvider.overrideWith(() => mockViewModel),
          ],
          child: const MaterialApp(
            home: HistoryScreen(),
          ),
        ),
      );

      expect(find.text(LocaleKeys.historyIsEmpty.tr()), findsNothing);
      expect(find.text('test code'), findsOneWidget);
    });
  });
}
