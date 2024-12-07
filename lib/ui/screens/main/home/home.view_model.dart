import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:workerbase_scanner/ui/screens/main/home/home.view_state.dart';

part 'home.view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  factory HomeViewModel() {
    return HomeViewModel._();
  }

  HomeViewModel._();

  @override
  HomeState build() => HomeState.initial();
}
