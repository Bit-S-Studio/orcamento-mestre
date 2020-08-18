import 'package:firebase_auth/firebase_auth.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';

part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  HasuraConnect _hasuraConnect =
      HasuraConnect('https://orcamentomestre.herokuapp.com/v1/graphql');

  @observable
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @observable
  bool logado = false;

  @observable
  FirebaseUser currentUser;

  @observable
  String uid;

  @observable
  String nome;

  @observable
  String imagem;

  @observable
  String email;

  @observable
  String senha;

  @observable
  String plano;

  @observable
  String telefone;

  @observable
  String tipo;

  @action
  Future<bool> setUser() async {
    try {
      currentUser = await firebaseAuth.currentUser();
      if (currentUser == null) {
        logado = false;
      } else {
        logado = true;
      }
    } catch (e) {
      print(e);
    }
    return logado;
  }

  @action
  Future<String> setUid() async {
    try {
      currentUser = await firebaseAuth.currentUser();
      if (currentUser == null) {
        uid = currentUser.uid.toString();
        getUser(uid);
      } else {
        uid = 'null';
      }
    } catch (e) {
      print(e);
    }
    return uid;
  }

  @action
  Future<dynamic> getUser(String id) async {
    var query = """
      query getUser(\$id:String!) {
        users(where: {id: {_eq: \$id}}) {
          email
          id
          imagem
          nome
          telefone
          tipo
        }
      }
    """;
    var doc = await _hasuraConnect.query(query, variables: {
      "id": id,
    });
    if (doc["data"]["users"].isEmpty) {
      print('vazio');
    } else {
      if (doc["data"]["users"].length > 0) {
        for (var document in doc["data"]["users"]) {
          email = document["email"];
          uid = document["id"];
          imagem = document["imagem"];
          nome = document["nome"];
          telefone = document["telefone"];
          tipo = document["tipo"];
        }
      }
    }
    return doc;
  }
}
