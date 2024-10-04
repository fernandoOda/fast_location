import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import '../model/cep_model.dart';

part 'cep_controller.g.dart';

class CepController = _CepControllerBase with _$CepController;

abstract class _CepControllerBase with Store {
  // Cria uma instância do Dio para realizar requisições HTTP
  final Dio _dio = Dio();

  // Observable para armazenar o resultado da busca de CEP
  @observable
  CepModel? cepResult;

  // Observable para armazenar o estado de carregamento
  @observable
  bool isLoading = false;

  // Observable para armazenar erros
  @observable
  String? errorMessage;

  // Ação para buscar o CEP
  @action
  Future<void> searchCep(String cep) async {
    isLoading = true;
    errorMessage = null;

    try {
      // Fazendo a requisição à API externa (usando o ViaCEP como exemplo)
      final response = await _dio.get('https://viacep.com.br/ws/$cep/json/');

      if (response.statusCode == 200 &&
          response.data != null &&
          !(response.data["erro"] == "true")) {
        cepResult = CepModel.fromJson(response.data);
      } else {
        errorMessage = 'Erro ao buscar CEP: formato válido, mas inexistente';
      }
    } catch (e) {
      errorMessage = 'Erro ao buscar CEP: CEP com formato inválido';
    } finally {
      isLoading = false;
    }
  }
}
