class Singleton {
  bool isDarkMode = false;
  static final Singleton _singleton = Singleton._internal();
  factory Singleton() {
    return _singleton;
  }
  Singleton._internal();
}
