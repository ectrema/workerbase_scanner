enum RouterEnum {
  home(path: 'home'),
  history(path: 'history');

  final String path;

  const RouterEnum({required this.path});

  String get navigation => '/$path';
}
