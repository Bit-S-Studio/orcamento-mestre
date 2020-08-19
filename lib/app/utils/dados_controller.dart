import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:via_cep/via_cep.dart';
import 'package:path/path.dart';
part 'dados_controller.g.dart';

class DadosController = _DadosControllerBase with _$DadosController;

abstract class _DadosControllerBase with Store {
  final HasuraConnect _hasuraConnect;

  _DadosControllerBase(this._hasuraConnect);

  @observable
  List<String> listTipos = <String>[
    'Empresa',
    'Freelancer',
  ];
  @observable
  ObservableList<String> listServicos = ObservableList<String>();

  @observable
  @observable
  String tipo;

  @observable
  PickedFile logo;

  @observable
  String nome;

  @observable
  TextEditingController nomeController = TextEditingController();

  @observable
  String documento;

  @observable
  TextEditingController docController = TextEditingController();

  @observable
  String telefone1;

  @observable
  TextEditingController tel1Controller = TextEditingController();

  @observable
  String telefone2;

  @observable
  TextEditingController tel2Controller = TextEditingController();

  @observable
  String email;

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  String site;

  @observable
  TextEditingController siteController = TextEditingController();

  @observable
  String cep;

  @observable
  TextEditingController cepController = TextEditingController();

  @observable
  TextEditingController enderecoController = TextEditingController();

  @observable
  String endereco;

  @observable
  TextEditingController numController = TextEditingController();

  @observable
  String numero;

  @observable
  String cidade;

  @observable
  TextEditingController cidadeController = TextEditingController();

  @observable
  String bairro;

  @observable
  TextEditingController bairroController = TextEditingController();

  @observable
  String numero1;

  @observable
  TextEditingController ufController = TextEditingController();

  @observable
  String uf;

  @observable
  String uid;

  @observable
  bool logoStatus = false;

  @observable
  FileImage image;

  @observable
  PickedFile imageFile;

  @observable
  ImagePicker picker = ImagePicker();

  @action
  Future<PickedFile> getImage() async {
    try {
      final pickedFile = await picker.getImage(
        source: ImageSource.gallery,
      );
      imageFile = pickedFile;
      upImage(imageFile);
    } catch (e) {}
    (imageFile != null) ? logoStatus = true : logoStatus = false;
    return imageFile;
  }

  @observable
  String imgUrl;

  @action
  Future<String> upImage(PickedFile image) async {
    String fileName = basename(image.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('users/').child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(File(image.path));
    var completedTask = await uploadTask.onComplete;
    imgUrl = await completedTask.ref.getDownloadURL();
    return imgUrl;
  }

  @action
  Future getCEP(String ceps) async {
    var CEP = new via_cep();
    var result = await CEP.searchCEP(ceps, 'json', '');
    if (CEP.getResponse() == 200) {
      cep = ceps;
      enderecoController.text = CEP.getLogradouro();
      endereco = CEP.getLogradouro();
      cidadeController.text = CEP.getLocalidade();
      cidade = CEP.getLocalidade();
      bairroController.text = CEP.getBairro();
      bairro = CEP.getBairro();
      ufController.text = CEP.getUF();
      uf = CEP.getUF();
    } else {
      print('Código de Retorno: ' + CEP.getResponse().toString());
      print('Erro: ' + CEP.getBody());
    }
  }

  @action
  Future<dynamic> getUser(String id) async {
    uid = id;

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
          emailController.text = document["email"];
          id = document["id"];
          nomeController.text = document["nome"];
          tel1Controller.text = document["telefone"];
          email = document["email"];
          id = document["id"];
          tipo = document["tipo"];
          nome = document["nome"];
          telefone1 = document["telefone"];
          print(emailController.text);
        }
      }
    }
    return doc;
  }

  @action
  Future<dynamic> setDados({
    String tipo,
    String id,
    String nome,
    String logo,
    String cep,
    String logradouro,
    String numero,
    String bairro,
    String cidade,
    String uf,
    String documento,
    String telefone1,
    String telefone2,
    String email,
    String site,
    ObservableList<String> listServicos,
  }) async {
    if (tipo == 'Empresa') {
      var query = r"""
        mutation setDados($id:String!, $nome:String!, $logo:String!, $cep:String!, $logradouro:String!, $numero:String! $bairro:String!, $cidade:String!, $uf:String!, $telefone1:String!, $documento:String!, $telefone2:String!, $email:String!, $site:String! ) {
            insert_empresas(objects: {bairro: $bairro, cep: $cep, cidade: $cidade, email: $email, logo: $logo, id: $id, logradouro: $logradouro, numero: $numero, nome: $nome, site: $site, telefone1: $telefone1, documento: $documento, telefone2: $telefone2, uf: $uf}) {
              affected_rows
            }
          }
      """;
      var doc = await _hasuraConnect.mutation(query, variables: {
        "id": id,
        "nome": nome,
        "logo": logo,
        "cep": cep,
        "logradouro": logradouro,
        "numero": numero,
        "bairro": bairro,
        "cidade": cidade,
        "uf": uf,
        "documento": documento,
        "telefone1": telefone1,
        "telefone2": telefone2,
        "email": email,
        "site": site,
      });
      if (listServicos.length == 0) {
        print('lista vazia');
      } else {
        setServicos(id, listServicos);
      }
      return doc;
    } else {
      var query = r"""
        mutation setDados($id:String!, $nome:String!, $cep:String!, $logradouro:String!, $numero:String!, $bairro:String!, $cidade:String!, $uf:String!, $documento:String!, $telefone1:String!, $telefone2:String!, $email:String!, $site:String! ) {
            insert_freelancers(objects: {bairro: $bairro, cep: $cep, cidade: $cidade, email: $email, id: $id, logradouro: $logradouro, numero: $numero, nome: $nome, site: $site, documento: $documento, telefone1: $telefone1, telefone2: $telefone2, uf: $uf}) {
              affected_rows
            }
          }
      """;
      var doc = await _hasuraConnect.mutation(query, variables: {
        "id": id,
        "nome": nome,
        "cep": cep,
        "logradouro": logradouro,
        "bairro": bairro,
        "cidade": cidade,
        "uf": uf,
        "numero": numero,
        "documento": documento,
        "telefone1": telefone1,
        "telefone2": telefone2,
        "email": email,
        "site": site,
      });
      setServicos(id, listServicos);
      return doc;
    }
  }

  @action
  Future<dynamic> setServicos(String id, ObservableList<String> servicos) {
    String servico1 = 'vazio';
    String servico2 = 'vazio';
    String servico3 = 'vazio';
    String servico4 = 'vazio';
    String servico5 = 'vazio';

    if (servicos.length == 1) {
      servico1 = servicos[0];
    } else if (servicos.length == 2) {
      servico1 = servicos[0];
      servico2 = servicos[1];
    } else if (servicos.length == 3) {
      servico1 = servicos[0];
      servico2 = servicos[1];
      servico3 = servicos[2];
    } else if (servicos.length == 4) {
      servico1 = servicos[0];
      servico2 = servicos[1];
      servico3 = servicos[2];
      servico4 = servicos[3];
    } else if (servicos.length == 5) {
      servico1 = servicos[0];
      servico2 = servicos[1];
      servico3 = servicos[2];
      servico4 = servicos[3];
      servico5 = servicos[4];
    }

    print(id);
    print(servico1);
    print(servico2);
    print(servico3);
    print(servico4);
    print(servico5);

    setService(id, servico1, servico2, servico3, servico4, servico5);
  }

  @action
  Future<dynamic> setService(String id, String servico1, String servico2,
      String servico3, String servico4, String servico5) async {
    var query = r"""
        mutation setService($id:String! ,$servico1:String!, $servico2:String!, $servico3:String!, $servico4:String!, $servico5:String!,) {
          insert_servicos_users(objects: {id: $id, servico1: $servico1, servico2: $servico2, servico3: $servico3, servico4: $servico4, servico5: $servico5}) {
            affected_rows
          }
        }
      """;
    var doc = await _hasuraConnect.mutation(query, variables: {
      "id": id,
      "servico1": servico1,
      "servico2": servico2,
      "servico3": servico3,
      "servico4": servico4,
      "servico5": servico5,
    });
    return doc;
  }

  @action
  Future<dynamic> getDados(String id, String tipoDados) async {
    print(tipoDados);
    if (tipoDados != null) {
      if (tipoDados == 'Empresa') {
        var query = r"""
        query getDados($id:String!) {
          empresas(where: {id: {_eq: $id}}) {
            bairro
            cep
            cidade
            email
            id
            logo
            logradouro
            nome
            site
            telefone1
            telefone2
            uf
          }
        }
      """;
        var doc = await _hasuraConnect.query(query, variables: {
          "id": id,
        });
        if (doc["data"]["empresas"].isEmpty) {
          print('vazio');
        } else {
          if (doc["data"]["empresas"].length > 0) {
            for (var document in doc["data"]["empresas"]) {
              emailController.text = document["email"];
              logo = document["imagem"];
              nomeController.text = document["nome"];
              cepController.text = document["cep"];
              enderecoController.text = document["logradouro"];
              tel1Controller.text = document["telefone1"];
              tel2Controller.text = document["telefone2"];
              bairroController.text = document["bairro"];
              cidadeController.text = document["cidade"];
              ufController.text = document["uf"];
              siteController.text = document["telefone2"];
            }
          }
        }
        return doc;
      } else {
        var query = r"""
        query getDados($id:String!) {
          freelancers(where: {id: {_eq: $id}}) {
            bairro
            cep
            cidade
            email
            id
            logradouro
            nome
            site
            telefone1
            telefone2
            uf
            documento
          }
        }
      """;
        var doc = await _hasuraConnect.query(query, variables: {
          "id": id,
        });
        if (doc["data"]["freelancers"].isEmpty) {
          print('vazio');
        } else {
          if (doc["data"]["freelancers"].length > 0) {
            for (var document in doc["data"]["freelancers"]) {
              emailController.text = document["email"];
              nomeController.text = document["nome"];
              cepController.text = document["cep"];
              enderecoController.text = document["logradouro"];
              tel1Controller.text = document["telefone1"];
              tel2Controller.text = document["telefone2"];
              bairroController.text = document["bairro"];
              cidadeController.text = document["cidade"];
              ufController.text = document["uf"];
              siteController.text = document["telefone2"];
              docController.text = document["documento"];
            }
          }
        }
        return doc;
      }
    } else {}
  }
}
