import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:workerbase_scanner/core/localizations/localizations.dart';
import 'package:workerbase_scanner/ui/screens/main/main.view_state.dart';

part 'main.view_model.g.dart';

@riverpod
class MainViewModel extends _$MainViewModel {
  factory MainViewModel() {
    return MainViewModel._();
  }

  MainViewModel._();

  @override
  MainState build() => MainState.initial();

  String getTitle(int index) {
    switch (index) {
      case 1:
        return LocaleKeys.history.tr();
      default:
        return LocaleKeys.home.tr();
    }
  }

  void onItemTapped(int index, StatefulNavigationShell navigationShell) {
    state = state.copyWith(index: index);
    navigationShell.goBranch(index);
  }
}
