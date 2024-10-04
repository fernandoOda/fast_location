import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage {
  static const String historyBox = 'history';

  // Inicializa o Hive e abre a box de histórico
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(historyBox);
  }

  // Retorna a box de histórico
  static Box get history => Hive.box(historyBox);

  // Adiciona um endereço ao histórico (evitando duplicatas)
  static Future<void> addAddressToHistory(String address) async {
    final Box box = history;
    if (!box.values.contains(address)) {
      await box.add(address);
    }
  }

  // Recupera todos os endereços armazenados no histórico
  static List<String> getHistory() {
    final Box box = history;
    return box.values.cast<String>().toList();
  }

  // Limpa todo o histórico
  static Future<void> clearHistory() async {
    final Box box = history;
    await box.clear();
  }
}
