import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workerbase_scanner/ui/screens/main/home/home.view_model.dart';
import 'package:workerbase_scanner/ui/screens/main/home/home.view_state.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeState state = ref.watch<HomeState>(homeViewModelProvider);

    return Scaffold(
      body: state.loading
          ? const Center(child: CircularProgressIndicator())
          : const Padding(
              padding: EdgeInsets.only(left: 16),
              child: SafeArea(
                child: Center(
                  child: Text('Home Screen'),
                ),
              ),
            ),
    );
  }
}
