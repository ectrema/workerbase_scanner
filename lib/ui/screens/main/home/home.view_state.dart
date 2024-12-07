import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:workerbase_scanner/ui/abstraction/view_state_abs.dart';

part 'home.view_state.g.dart';

@CopyWith()
class HomeState extends ViewStateAbs {
  final bool loading;

  const HomeState({required this.loading}) : super();

  HomeState.initial() : loading = false;

  @override
  List<Object?> get props => <Object?>[loading];
}
