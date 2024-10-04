import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../shared/storage/local_storage.dart';
import '../components/resulted_addresses.dart';
import '../controller/cep_controller.dart';
import '../components/last_address_widget.dart';
import 'history_page.dart';

class HomePage extends StatelessWidget {
  final CepController _controller = CepController();
  final List<String> _consultedAddresses =
      []; // Lista para armazenar os endereços consultados

  HomePage({super.key}) {
    // Carregar o histórico de endereços consultados ao iniciar a página
    _consultedAddresses.addAll(LocalStorage.getHistory());
  }

  @override
  Widget build(BuildContext context) {
    // Função para salvar o endereço no histórico e localmente
    void saveToHistory(String address) {
      if (address.isNotEmpty && !_consultedAddresses.contains(address)) {
        _consultedAddresses.add(address); // Armazena os endereços consultados
        LocalStorage.addAddressToHistory(
            address); // Salva o endereço localmente
      }
    }

    // Função para abrir o Google Maps com o CEP
    Future<void> openMaps(String cep) async {
      final googleMapsUrl =
          'https://www.google.com/maps/search/?api=1&query=$cep';
      if (await canLaunch(googleMapsUrl)) {
        await launch(googleMapsUrl);
      } else {
        throw 'Não foi possível abrir o Google Maps com o CEP: $cep';
      }
    }

    // Método para abrir o dialog de busca de CEP
    void showCepDialog() {
      final TextEditingController cepController = TextEditingController();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: TextField(
              controller: cepController,
              decoration: const InputDecoration(labelText: 'Digite o CEP'),
              style: const TextStyle(fontSize: 14),
              keyboardType: TextInputType.number,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Fecha o dialog
                },
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  String cep = cepController.text;
                  _controller.searchCep(cep).then((_) {
                    saveToHistory(_controller.cepResult != null
                        ? '${_controller.cepResult!.logradouro}, ${_controller.cepResult!.bairro}, ${_controller.cepResult!.localidade}, ${_controller.cepResult!.uf}'
                        : '');
                    Navigator.of(context).pop(); // Fecha o dialog
                  });
                },
                child: const Text('Buscar'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('FastLocation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Botão para abrir o dialog de busca de CEP
            ElevatedButton(
              onPressed: showCepDialog,
              child: const Text('Localizar Endereço'),
            ),
            const SizedBox(height: 20),
            Observer(
              builder: (_) {
                if (_controller.isLoading) {
                  return const CircularProgressIndicator();
                } else if (_controller.errorMessage != null) {
                  return Text(_controller.errorMessage!,
                      style: const TextStyle(color: Colors.red));
                } else if (_controller.cepResult != null) {
                  final cep = _controller.cepResult!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Exibir os dados do CEP
                      Observer(
                        builder: (_) {
                          return CepResultWidget(cep: _controller.cepResult);
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          openMaps(cep.cep);
                        },
                        icon: const Icon(Icons.location_on),
                        label: const Text('Localizar Endereço no Mapa'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Último endereço localizado',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                      LastAddressWidget(cep: cep), // Exibe o último endereço
                      const SizedBox(height: 20),
                    ],
                  );
                } else {
                  return const Text('Faça uma busca para localizar seu destino',
                      style: TextStyle(color: Colors.black54));
                }
              },
            ),
            const SizedBox(height: 20),
            // Botão de exibição do histórico
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        HistoryPage(consultedAddresses: _consultedAddresses),
                  ),
                );
              },
              child: const Text('Histórico de Consultas'),
            ),
          ],
        ),
      ),
    );
  }
}
