import 'package:flutter/material.dart';

class EnderecoConsultadoList extends StatelessWidget {
  final List<String> enderecosConsultados;

  const EnderecoConsultadoList({Key? key, required this.enderecosConsultados})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return enderecosConsultados.isEmpty
        ? const Center(
            child: Text(
            'Nenhum endereço consultado ainda',
            style: TextStyle(color: Colors.black54),
          ))
        : ListView.builder(
            itemCount: enderecosConsultados.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(enderecosConsultados[index]),
                textColor: Colors.black54,
                leading: const Icon(Icons.location_on),
                onTap: () {
                  // Ação ao clicar no endereço (se necessário)
                },
              );
            },
          );
  }
}
