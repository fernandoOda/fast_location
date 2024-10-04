class CepModel {
  final String cep;
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;
  final String complemento;

  // Construtor do modelo com o campo complemento
  CepModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
    this.complemento = '',
  });

  // Método para converter JSON em CepModel
  factory CepModel.fromJson(Map<String, dynamic> json) {
    return CepModel(
      cep: json['cep'] ?? '',
      logradouro: json['logradouro'] ?? '',
      bairro: json['bairro'] ?? '',
      localidade: json['localidade'] ?? '',
      uf: json['uf'] ?? '',
      complemento: json['complemento'] ?? '',
    );
  }

  // Método para converter CepModel em JSON (se necessário)
  Map<String, dynamic> toJson() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'complemento': complemento,
    };
  }
}
