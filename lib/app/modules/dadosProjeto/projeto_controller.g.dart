// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projeto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjetoController on _ProjetoControllerBase, Store {
  final _$categoriaControllerAtom =
      Atom(name: '_ProjetoControllerBase.categoriaController');

  @override
  TextEditingController get categoriaController {
    _$categoriaControllerAtom.reportRead();
    return super.categoriaController;
  }

  @override
  set categoriaController(TextEditingController value) {
    _$categoriaControllerAtom.reportWrite(value, super.categoriaController, () {
      super.categoriaController = value;
    });
  }

  final _$itemControllerAtom =
      Atom(name: '_ProjetoControllerBase.itemController');

  @override
  TextEditingController get itemController {
    _$itemControllerAtom.reportRead();
    return super.itemController;
  }

  @override
  set itemController(TextEditingController value) {
    _$itemControllerAtom.reportWrite(value, super.itemController, () {
      super.itemController = value;
    });
  }

  final _$valorControllerAtom =
      Atom(name: '_ProjetoControllerBase.valorController');

  @override
  TextEditingController get valorController {
    _$valorControllerAtom.reportRead();
    return super.valorController;
  }

  @override
  set valorController(TextEditingController value) {
    _$valorControllerAtom.reportWrite(value, super.valorController, () {
      super.valorController = value;
    });
  }

  final _$tempoControllerAtom =
      Atom(name: '_ProjetoControllerBase.tempoController');

  @override
  TextEditingController get tempoController {
    _$tempoControllerAtom.reportRead();
    return super.tempoController;
  }

  @override
  set tempoController(TextEditingController value) {
    _$tempoControllerAtom.reportWrite(value, super.tempoController, () {
      super.tempoController = value;
    });
  }

  final _$indexCategoriaAtom =
      Atom(name: '_ProjetoControllerBase.indexCategoria');

  @override
  int get indexCategoria {
    _$indexCategoriaAtom.reportRead();
    return super.indexCategoria;
  }

  @override
  set indexCategoria(int value) {
    _$indexCategoriaAtom.reportWrite(value, super.indexCategoria, () {
      super.indexCategoria = value;
    });
  }

  final _$indexItemAtom = Atom(name: '_ProjetoControllerBase.indexItem');

  @override
  int get indexItem {
    _$indexItemAtom.reportRead();
    return super.indexItem;
  }

  @override
  set indexItem(int value) {
    _$indexItemAtom.reportWrite(value, super.indexItem, () {
      super.indexItem = value;
    });
  }

  final _$itemHeightAtom = Atom(name: '_ProjetoControllerBase.itemHeight');

  @override
  double get itemHeight {
    _$itemHeightAtom.reportRead();
    return super.itemHeight;
  }

  @override
  set itemHeight(double value) {
    _$itemHeightAtom.reportWrite(value, super.itemHeight, () {
      super.itemHeight = value;
    });
  }

  final _$listItensAtom = Atom(name: '_ProjetoControllerBase.listItens');

  @override
  ObservableList<ItemModel> get listItens {
    _$listItensAtom.reportRead();
    return super.listItens;
  }

  @override
  set listItens(ObservableList<ItemModel> value) {
    _$listItensAtom.reportWrite(value, super.listItens, () {
      super.listItens = value;
    });
  }

  final _$listCategoriasAtom =
      Atom(name: '_ProjetoControllerBase.listCategorias');

  @override
  ObservableList<String> get listCategorias {
    _$listCategoriasAtom.reportRead();
    return super.listCategorias;
  }

  @override
  set listCategorias(ObservableList<String> value) {
    _$listCategoriasAtom.reportWrite(value, super.listCategorias, () {
      super.listCategorias = value;
    });
  }

  final _$valorAtom = Atom(name: '_ProjetoControllerBase.valor');

  @override
  double get valor {
    _$valorAtom.reportRead();
    return super.valor;
  }

  @override
  set valor(double value) {
    _$valorAtom.reportWrite(value, super.valor, () {
      super.valor = value;
    });
  }

  final _$categoriaAtom = Atom(name: '_ProjetoControllerBase.categoria');

  @override
  String get categoria {
    _$categoriaAtom.reportRead();
    return super.categoria;
  }

  @override
  set categoria(String value) {
    _$categoriaAtom.reportWrite(value, super.categoria, () {
      super.categoria = value;
    });
  }

  final _$descricaoAtom = Atom(name: '_ProjetoControllerBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  final _$tempoAtom = Atom(name: '_ProjetoControllerBase.tempo');

  @override
  DateTime get tempo {
    _$tempoAtom.reportRead();
    return super.tempo;
  }

  @override
  set tempo(DateTime value) {
    _$tempoAtom.reportWrite(value, super.tempo, () {
      super.tempo = value;
    });
  }

  final _$setValorAsyncAction = AsyncAction('_ProjetoControllerBase.setValor');

  @override
  Future<double> setValor(String newValor) {
    return _$setValorAsyncAction.run(() => super.setValor(newValor));
  }

  final _$setItemAsyncAction = AsyncAction('_ProjetoControllerBase.setItem');

  @override
  Future<dynamic> setItem() {
    return _$setItemAsyncAction.run(() => super.setItem());
  }

  final _$getItensAsyncAction = AsyncAction('_ProjetoControllerBase.getItens');

  @override
  Future<ObservableList<ItemModel>> getItens(String query) {
    return _$getItensAsyncAction.run(() => super.getItens(query));
  }

  final _$_ProjetoControllerBaseActionController =
      ActionController(name: '_ProjetoControllerBase');

  @override
  dynamic changeTempo(DateTime newTempo) {
    final _$actionInfo = _$_ProjetoControllerBaseActionController.startAction(
        name: '_ProjetoControllerBase.changeTempo');
    try {
      return super.changeTempo(newTempo);
    } finally {
      _$_ProjetoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCategoria(String newCategoria) {
    final _$actionInfo = _$_ProjetoControllerBaseActionController.startAction(
        name: '_ProjetoControllerBase.changeCategoria');
    try {
      return super.changeCategoria(newCategoria);
    } finally {
      _$_ProjetoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDescricao(String newDescricao) {
    final _$actionInfo = _$_ProjetoControllerBaseActionController.startAction(
        name: '_ProjetoControllerBase.changeDescricao');
    try {
      return super.changeDescricao(newDescricao);
    } finally {
      _$_ProjetoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categoriaController: ${categoriaController},
itemController: ${itemController},
valorController: ${valorController},
tempoController: ${tempoController},
indexCategoria: ${indexCategoria},
indexItem: ${indexItem},
itemHeight: ${itemHeight},
listItens: ${listItens},
listCategorias: ${listCategorias},
valor: ${valor},
categoria: ${categoria},
descricao: ${descricao},
tempo: ${tempo}
    ''';
  }
}
