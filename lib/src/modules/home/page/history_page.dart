import 'package:flutter/material.dart';
import '../components/consulted_addresses.dart';

class HistoryPage extends StatelessWidget {
  final List<String> consultedAddresses;

  const HistoryPage({Key? key, required this.consultedAddresses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Consultas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: EnderecoConsultadoList(enderecosConsultados: consultedAddresses),
      ),
    );
  }
}
