class RoutesPath {
  static const String home = '/';
  static const String addUser = '/addUser';

  static removeSlash(String path) => path.replaceAll('/', '');
}
