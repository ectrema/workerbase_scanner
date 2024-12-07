import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:workerbase_scanner/ui/abstraction/view_state_abs.dart';

part 'history.view_state.g.dart';

@CopyWith()
class HistoryState extends ViewStateAbs {
  final bool loading;

  const HistoryState({required this.loading}) : super();

  HistoryState.initial() : loading = false;

  @override
  List<Object?> get props => <Object?>[loading];
}
