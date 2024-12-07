import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:workerbase_scanner/ui/abstraction/view_state_abs.dart';

part 'main.view_state.g.dart';

@CopyWith()
class MainState extends ViewStateAbs {
  final int index;
  const MainState(this.index) : super();

  MainState.initial() : index = 0;

  @override
  List<Object?> get props => <Object?>[index];
}
