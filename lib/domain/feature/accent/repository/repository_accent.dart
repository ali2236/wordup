import '../model/accent.dart';

abstract class AccentRepository {
  Accent getAccent();
  void setAccent(Accent accent);
}
