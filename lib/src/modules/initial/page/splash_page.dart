import 'package:flutter/material.dart';
import 'package:fast_location/src/shared/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key}); // Adicionando o parâmetro 'key'

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(
        const Duration(seconds: 3)); // Simula um tempo de splash
    Navigator.pushReplacementNamed(
        context, AppRoutes.home); // Redireciona para a HomePage
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Animação de loading
      ),
    );
  }
}
