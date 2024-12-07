import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workerbase_scanner/ui/screens/main/history/history.view_model.dart';
import 'package:workerbase_scanner/ui/screens/main/history/history.view_state.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HistoryState state =
        ref.watch<HistoryState>(historyViewModelProvider);

    return Scaffold(
      body: state.loading
          ? const Center(child: CircularProgressIndicator())
          : const Padding(
              padding: EdgeInsets.only(left: 16),
              child: SafeArea(
                child: Center(
                  child: Text('History Screen'),
                ),
              ),
            ),
    );
  }
}
