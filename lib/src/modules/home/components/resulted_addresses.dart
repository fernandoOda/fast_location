import 'package:flutter/material.dart';
import '../model/cep_model.dart';

class CepResultWidget extends StatelessWidget {
  final CepModel? cep;

  const CepResultWidget({Key? key, required this.cep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Verifica se o cep é nulo ou vazio, e exibe uma mensagem padrão
    if (cep == null) {
      return const Text(
        'Faça uma busca para localizar seu destino',
        style: TextStyle(color: Colors.black54),
      );
    }

    // Exibe os resultados do CEP
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Dados da Localização',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRichText('Logradouro/Rua', cep!.logradouro),
              const SizedBox(height: 5),
              _buildRichText('Bairro/Distrito', cep!.bairro),
              const SizedBox(height: 5),
              _buildRichText('Cidade/UF', '${cep!.localidade}/${cep!.uf}'),
              const SizedBox(height: 5),
              _buildRichText('CEP', cep!.cep),
              const SizedBox(height: 5),
              _buildRichText(
                'Complemento',
                cep!.complemento.isNotEmpty
                    ? cep!.complemento
                    : 'Não informado',
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Função para construir o RichText com estilo
  Widget _buildRichText(String title, String value) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 14,
        ),
        children: [
          TextSpan(
            text: '$title: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          TextSpan(text: value),
        ],
      ),
    );
  }
}
