import 'package:flutter/material.dart';
import 'package:fast_location/src/modules/initial/page/splash_page.dart';
import 'package:fast_location/src/modules/home/page/home_page.dart';
import 'package:fast_location/src/shared/routes/app_routes.dart';
import 'package:fast_location/src/shared/storage/local_storage.dart';
import 'package:flutter/services.dart';
import 'src/modules/home/page/history_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const FastLocationApp());
  });
  await LocalStorage.init(); // Inicialização do armazenamento local
}

class FastLocationApp extends StatelessWidget {
  const FastLocationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastLocation',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const SplashPage(),
        AppRoutes.home: (context) => HomePage(),
        AppRoutes.history: (context) => const HistoryPage(
              consultedAddresses: [],
            ),
      },
    );
  }
}
