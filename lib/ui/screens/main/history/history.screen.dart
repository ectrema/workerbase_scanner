import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workerbase_scanner/core/localizations/localizations.dart';
import 'package:workerbase_scanner/core/routing/app_router.dart';
import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';
import 'package:workerbase_scanner/ui/screens/main/history/history.view_model.dart';
import 'package:workerbase_scanner/ui/screens/main/history/history.view_state.dart';

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

                    return _QrCodeItem(
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

class _QrCodeItem extends StatelessWidget {
  const _QrCodeItem({
    required this.qrCode,
    required this.onDelete,
    required this.onTap,
  });

  final QrCodeEntity qrCode;

  final VoidCallback onDelete;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F3D3),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Text(
                qrCode.qrCode,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
