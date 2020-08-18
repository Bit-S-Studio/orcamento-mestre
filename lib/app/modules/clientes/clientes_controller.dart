import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';

part 'clientes_controller.g.dart';

class ClientesController = _ClientesControllerBase with _$ClientesController;

abstract class _ClientesControllerBase with Store {
  final HasuraConnect _hasuraConnect;

  _ClientesControllerBase(this._hasuraConnect);

  @observable
  String nome;

  @observable
  ObservableList<String> listClientes = ObservableList<String>();

  @observable
  String email;

  @observable
  String telefone;

  @observable
  String endereco;

  @observable
  String numero;

  @observable
  bool status = true;

  @observable
  String id;

  @observable
  String userId;

  @observable
  TextEditingController nomeController = TextEditingController();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController telefoneController = TextEditingController();

  @observable
  TextEditingController enderecoController = TextEditingController();

  @observable
  TextEditingController numeroController = TextEditingController();

  @action
  Future<dynamic> setClientes(String id, String nome, String email,
      String telefone, String endereco, String numero) async {
    var query = r"""
      mutation setClientes($id:String!,$nome:String!,$email:String!,$telefone:String!,$endereco:String!,$numero:String!) {
        insert_clientes(objects: {email: $email, endereco: $endereco, nome: $nome, numero: $numero, telefone: $telefone, user_id: $id}) {
          returning {
            id
          }
        }
      }
    """;
    var doc = await _hasuraConnect.mutation(query, variables: {
      "id": id,
      "nome": nome,
      "email": email,
      "telefone": telefone,
      "endereco": endereco,
      "numero": numero,
    });
    return doc;
  }

  @action
  Future<dynamic> getClientes(String id) async {
    var query = r"""
      query getClientes($id:String!) {
        clientes(where: {user_id: {_eq: $id}}) {
          email
          endereco
          nome
          numero
          telefone
          id
        }
      }
    """;
    var doc = await _hasuraConnect.query(query, variables: {"id": id});
    if (doc["data"]["clientes"].isEmpty) {
      print('vazio');
    } else {
      if (doc["data"]["clientes"].length > 0) {
        for (var document in doc["data"]["clientes"]) {
          listClientes.add(document["nome"]);
        }
      }
    }
    return doc;
  }

  @action
  Future<List> getSuggestions(String query) async {
    List<String> clientesSugestao = List();
    clientesSugestao.addAll(listClientes);
    clientesSugestao
        .retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return clientesSugestao;
  }

  @action
  Future<dynamic> getCliente(String id) async {
    var query = r"""
      query MyQuery($id:String!) {
        clientes(where: {id: {_eq: $id}}) {
          email
          endereco
          nome
          numero
          telefone
          id
        }
      }
    """;
    var doc = await _hasuraConnect.query(query);
    if (doc["data"]["clientes"].isEmpty) {
      print('vazio');
    } else {
      if (doc["data"]["clientes"].length > 0) {
        for (var document in doc["data"]["clientes"]) {
          nome = document['nome'];
          nomeController = document['nome'];
          email = document['email'];
          emailController = document['email'];
          telefone = document['telefone'];
          telefoneController = document['telefone'];
          endereco = document['endereco'];
          enderecoController = document['endereco'];
          numero = document['numero'];
          numeroController = document['numero'];
        }
      }
    }
    return doc;
  }
}
