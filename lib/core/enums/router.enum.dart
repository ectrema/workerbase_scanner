enum RouterEnum {
  home(path: 'home'),
  history(path: 'history'),
  scanDetail(path: 'scan-detail');

  final String path;

  const RouterEnum({required this.path});

  String get navigation => '/$path';
}
