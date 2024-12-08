import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:workerbase_scanner/core/localizations/localizations.dart';
import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';
import 'package:workerbase_scanner/ui/screens/scan_detail/scan_detail.view_model.dart';
import 'package:workerbase_scanner/ui/screens/scan_detail/scan_detail.view_state.dart';

class ScanDetailScreen extends ConsumerStatefulWidget {
  final QrCodeEntity qrCode;

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
    final ScanDetailViewModel viewModel =
        ref.watch<ScanDetailViewModel>(scanDetailViewModelProvider.notifier);
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.scanDetail.tr()),
      ),
      body: state.qrCode == null
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F3D3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.only(top: 16),
                        padding: const EdgeInsets.all(24),
                        child: PrettyQrView.data(
                          data: state.qrCode!.qrCode,
                          decoration: const PrettyQrDecoration(
                            background: Color(0xFFF2F3D3),
                          ),
                          errorBuilder:
                              (_, Object error, StackTrace? stackTrace) {
                            return SizedBox(
                              height: size.height * 0.4,
                              child: Center(
                                child: Text(
                                  LocaleKeys.anErrorOccurred.tr(
                                    args: <String>[error.toString()],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          state.qrCode!.qrCode,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          LocaleKeys.formatOfQrCode.tr(
                            args: <String>[
                              state.qrCode!.format.name,
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          LocaleKeys.typeOfQrCode.tr(
                            args: <String>[
                              state.qrCode!.type.name,
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFEEF321),
                              ),
                              onPressed: () {
                                Clipboard.setData(
                                  ClipboardData(text: state.qrCode!.qrCode),
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text(LocaleKeys.copiedToClipboard.tr()),
                                  ),
                                );
                              },
                              child: Text(
                                LocaleKeys.copyToClipboard.tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          if (state.hasAction) const SizedBox(width: 8),
                          if (state.hasAction)
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFF2F3D3),
                                ),
                                onPressed: viewModel.onActionTap,
                                child: Text(
                                  state.hasCalendarEvent
                                      ? LocaleKeys.addEventToCalendar.tr()
                                      : LocaleKeys.openTheLink.tr(),
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
