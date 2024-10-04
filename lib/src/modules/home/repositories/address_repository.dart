import 'package:fast_location/src/shared/http/api_client.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';

class AddressRepository {
  Future<Address> getAddressByCep(String cep) async {
    final response = await ApiClient.getCep(cep);
    return Address.fromJson(response.data);
  }
}
