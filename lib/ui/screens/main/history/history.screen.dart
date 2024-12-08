import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workerbase_scanner/core/localizations/localizations.dart';
import 'package:workerbase_scanner/core/routing/app_router.dart';
import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';
import 'package:workerbase_scanner/ui/screens/main/history/history.view_model.dart';
import 'package:workerbase_scanner/ui/screens/main/history/history.view_state.dart';
import 'package:workerbase_scanner/ui/widget/qr_code.item.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HistoryState state =
        ref.watch<HistoryState>(historyViewModelProvider);
    final HistoryViewModel viewModel =
        ref.read<HistoryViewModel>(historyViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.history.tr(),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              if (state.savedQrCodes.isEmpty)
                SliverFillRemaining(
                  child: Center(
                    child: Text(
                      LocaleKeys.historyIsEmpty.tr(),
                    ),
                  ),
                ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 16),
                sliver: SliverList.builder(
                  itemBuilder: (_, int index) {
                    final QrCodeEntity qrCode = state.savedQrCodes[index];

                    return QrCodeItem(
                      qrCode: qrCode,
                      onDelete: () => viewModel.deleteQrCode(qrCode),
                      onTap: () => router.push(
                        RouterEnum.scanDetail.navigation,
                        extra: qrCode,
                      ),
                    );
                  },
                  itemCount: state.savedQrCodes.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
