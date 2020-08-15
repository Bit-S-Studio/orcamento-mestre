import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';

part 'servicos_controller.g.dart';

class ServicosController = _ServicosControllerBase with _$ServicosController;

abstract class _ServicosControllerBase with Store {
  HasuraConnect _hasuraConnect =
      HasuraConnect('https://orcamentomestre.herokuapp.com/v1/graphql');

  @observable
  String servico;

  @observable
  ObservableList<String> listServicos = ObservableList<String>();

  @action
  Future<dynamic> getServicos() async {
    var query = """
      query getServicos{
        servicos {
          nome
        }
      }
    """;
    var doc = await _hasuraConnect.query(query);
    if (doc["data"]["servicos"].isEmpty) {
      print('vazio');
    } else {
      if (doc["data"]["servicos"].length > 0) {
        for (var document in doc["data"]["servicos"]) {
          listServicos.add(document["nome"]);
        }
      }
    }
    return doc;
  }

  @action
  Future<List> getSuggestions(String query) async {
    List<String> servicosSugestao = List();
    servicosSugestao.addAll(listServicos);
    servicosSugestao
        .retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return servicosSugestao;
  }

  @observable
  ObservableList<String> listServicosE = ObservableList<String>();
}
