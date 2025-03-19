
abstract class Injector {
  static Injector? _instance;
  static Injector get instance => _instance!;

  static Future<void> init(Injector injector) async {
    _instance = injector;
    await injector.initialize();
  }

  Future<void> initialize();

  T get<T extends Object>();
}

T locate<T extends Object>() => Injector.instance.get<T>();