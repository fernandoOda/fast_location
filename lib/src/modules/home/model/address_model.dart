class Address {
  final String cep;
  final String street;
  final String city;
  final String state;

  Address(
      {required this.cep,
      required this.street,
      required this.city,
      required this.state});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      cep: json['cep'],
      street: json['logradouro'],
      city: json['localidade'],
      state: json['uf'],
    );
  }
}
