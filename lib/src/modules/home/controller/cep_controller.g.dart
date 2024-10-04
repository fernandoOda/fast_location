// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CepController on _CepControllerBase, Store {
  late final _$cepResultAtom =
      Atom(name: '_CepControllerBase.cepResult', context: context);

  @override
  CepModel? get cepResult {
    _$cepResultAtom.reportRead();
    return super.cepResult;
  }

  @override
  set cepResult(CepModel? value) {
    _$cepResultAtom.reportWrite(value, super.cepResult, () {
      super.cepResult = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CepControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CepControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$searchCepAsyncAction =
      AsyncAction('_CepControllerBase.searchCep', context: context);

  @override
  Future<void> searchCep(String cep) {
    return _$searchCepAsyncAction.run(() => super.searchCep(cep));
  }

  @override
  String toString() {
    return '''
cepResult: ${cepResult},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
