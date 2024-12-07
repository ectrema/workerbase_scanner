import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workerbase_scanner/core/localizations/localizations.dart';
import 'package:workerbase_scanner/ui/screens/scan_detail/scan_detail.view_model.dart';
import 'package:workerbase_scanner/ui/screens/scan_detail/scan_detail.view_state.dart';

class ScanDetailScreen extends ConsumerStatefulWidget {
  final String qrCode;

  const ScanDetailScreen({super.key, required this.qrCode});

  @override
  ConsumerState<ScanDetailScreen> createState() => _ScanDetailBody();
}

class _ScanDetailBody extends ConsumerState<ScanDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read<ScanDetailViewModel>(scanDetailViewModelProvider.notifier)
          .init(widget.qrCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ScanDetailState state =
        ref.watch<ScanDetailState>(scanDetailViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.scanDetail.tr()),
      ),
      body: state.qrCode == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SafeArea(
                child: Center(
                  child: Text(state.qrCode!),
                ),
              ),
            ),
    );
  }
}
