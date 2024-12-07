import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:workerbase_scanner/core/localizations/localizations.dart';
import 'package:workerbase_scanner/ui/screens/main/home/home.view_model.dart';
import 'package:workerbase_scanner/ui/screens/main/home/home.view_state.dart';
import 'package:workerbase_scanner/ui/widget/dashed_shape.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read<HomeViewModel>(homeViewModelProvider.notifier).init();
  }

  @override
  void dispose() {
    super.dispose();
    ref.read<HomeViewModel>(homeViewModelProvider.notifier).onDispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeState state = ref.watch<HomeState>(homeViewModelProvider);
    final HomeViewModel viewModel =
        ref.read<HomeViewModel>(homeViewModelProvider.notifier);
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.qrCodeScanner.tr()),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: size.width * 0.9,
                          height: size.height * 0.6,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F3D3),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        SizedBox.square(
                          dimension: size.width * 0.7,
                          child: CustomPaint(
                            painter: const DashRectPainter(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: state.cameraEnabled
                                  ? MobileScanner(
                                      controller: viewModel.controller,
                                      fit: BoxFit.fitWidth,
                                    )
                                  : ClipRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 40,
                                          sigmaY: 40,
                                        ),
                                        child: ColoredBox(
                                          color: Colors.grey.withOpacity(0.4),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!state.cameraEnabled)
                    Center(
                      child: GestureDetector(
                        onTap: viewModel.requestCameraPermission,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: ElevatedButton(
                            onPressed: viewModel.requestCameraPermission,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                LocaleKeys.cameraPermissionNotGranted.tr(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
