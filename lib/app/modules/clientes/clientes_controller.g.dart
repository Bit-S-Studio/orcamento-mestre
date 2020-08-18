// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clientes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientesController on _ClientesControllerBase, Store {
  final _$nomeAtom = Atom(name: '_ClientesControllerBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$listClientesAtom = Atom(name: '_ClientesControllerBase.listClientes');

  @override
  ObservableList<String> get listClientes {
    _$listClientesAtom.reportRead();
    return super.listClientes;
  }

  @override
  set listClientes(ObservableList<String> value) {
    _$listClientesAtom.reportWrite(value, super.listClientes, () {
      super.listClientes = value;
    });
  }

  final _$emailAtom = Atom(name: '_ClientesControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$telefoneAtom = Atom(name: '_ClientesControllerBase.telefone');

  @override
  String get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  final _$enderecoAtom = Atom(name: '_ClientesControllerBase.endereco');

  @override
  String get endereco {
    _$enderecoAtom.reportRead();
    return super.endereco;
  }

  @override
  set endereco(String value) {
    _$enderecoAtom.reportWrite(value, super.endereco, () {
      super.endereco = value;
    });
  }

  final _$numeroAtom = Atom(name: '_ClientesControllerBase.numero');

  @override
  String get numero {
    _$numeroAtom.reportRead();
    return super.numero;
  }

  @override
  set numero(String value) {
    _$numeroAtom.reportWrite(value, super.numero, () {
      super.numero = value;
    });
  }

  final _$idAtom = Atom(name: '_ClientesControllerBase.id');

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$userIdAtom = Atom(name: '_ClientesControllerBase.userId');

  @override
  String get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  final _$nomeControllerAtom =
      Atom(name: '_ClientesControllerBase.nomeController');

  @override
  TextEditingController get nomeController {
    _$nomeControllerAtom.reportRead();
    return super.nomeController;
  }

  @override
  set nomeController(TextEditingController value) {
    _$nomeControllerAtom.reportWrite(value, super.nomeController, () {
      super.nomeController = value;
    });
  }

  final _$emailControllerAtom =
      Atom(name: '_ClientesControllerBase.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  final _$telefoneControllerAtom =
      Atom(name: '_ClientesControllerBase.telefoneController');

  @override
  TextEditingController get telefoneController {
    _$telefoneControllerAtom.reportRead();
    return super.telefoneController;
  }

  @override
  set telefoneController(TextEditingController value) {
    _$telefoneControllerAtom.reportWrite(value, super.telefoneController, () {
      super.telefoneController = value;
    });
  }

  final _$enderecoControllerAtom =
      Atom(name: '_ClientesControllerBase.enderecoController');

  @override
  TextEditingController get enderecoController {
    _$enderecoControllerAtom.reportRead();
    return super.enderecoController;
  }

  @override
  set enderecoController(TextEditingController value) {
    _$enderecoControllerAtom.reportWrite(value, super.enderecoController, () {
      super.enderecoController = value;
    });
  }

  final _$numeroControllerAtom =
      Atom(name: '_ClientesControllerBase.numeroController');

  @override
  TextEditingController get numeroController {
    _$numeroControllerAtom.reportRead();
    return super.numeroController;
  }

  @override
  set numeroController(TextEditingController value) {
    _$numeroControllerAtom.reportWrite(value, super.numeroController, () {
      super.numeroController = value;
    });
  }

  final _$setClientesAsyncAction =
      AsyncAction('_ClientesControllerBase.setClientes');

  @override
  Future<dynamic> setClientes(String id, String nome, String email,
      String telefone, String endereco, String numero) {
    return _$setClientesAsyncAction.run(
        () => super.setClientes(id, nome, email, telefone, endereco, numero));
  }

  final _$getClientesAsyncAction =
      AsyncAction('_ClientesControllerBase.getClientes');

  @override
  Future<dynamic> getClientes(String id) {
    return _$getClientesAsyncAction.run(() => super.getClientes(id));
  }

  final _$getSuggestionsAsyncAction =
      AsyncAction('_ClientesControllerBase.getSuggestions');

  @override
  Future<List<dynamic>> getSuggestions(String query) {
    return _$getSuggestionsAsyncAction.run(() => super.getSuggestions(query));
  }

  final _$getClienteAsyncAction =
      AsyncAction('_ClientesControllerBase.getCliente');

  @override
  Future<dynamic> getCliente(String id) {
    return _$getClienteAsyncAction.run(() => super.getCliente(id));
  }

  @override
  String toString() {
    return '''
nome: ${nome},
listClientes: ${listClientes},
email: ${email},
telefone: ${telefone},
endereco: ${endereco},
numero: ${numero},
id: ${id},
userId: ${userId},
nomeController: ${nomeController},
emailController: ${emailController},
telefoneController: ${telefoneController},
enderecoController: ${enderecoController},
numeroController: ${numeroController}
    ''';
  }
}
