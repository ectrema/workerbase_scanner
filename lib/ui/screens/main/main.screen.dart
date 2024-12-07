import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:workerbase_scanner/ui/screens/main/main.view_model.dart';
import 'package:workerbase_scanner/ui/screens/main/main.view_state.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainViewModel viewModel = ref.read(mainViewModelProvider.notifier);
    final int currentIndex =
        ref.watch(mainViewModelProvider.select((MainState s) => s.index));

    return Scaffold(
      body: navigationShell,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomNavigationBar: Container(
        color: const Color(0xFFF2F3D3),
        padding:
            const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 12),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 4, right: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List<Widget>.generate(
                2,
                (int index) => Expanded(
                  child: GestureDetector(
                    onTap: () => viewModel.onItemTapped(index, navigationShell),
                    child: AnimatedContainer(
                      margin: EdgeInsets.only(top: 4, bottom: 4),
                      duration: Duration(milliseconds: 200),
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        color: currentIndex == index
                            ? const Color(0xFFEEF321)
                            : null,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topCenter,
                              heightFactor: 1.0,
                              child: Icon(
                                index == 0 ? Icons.home : Icons.history,
                              ),
                            ),
                            Text(
                              viewModel.getTitle(index),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
