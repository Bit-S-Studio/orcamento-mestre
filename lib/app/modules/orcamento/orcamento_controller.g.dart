// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orcamento_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrcamentoController on _OrcamentoControllerBase, Store {
  final _$textoAtom = Atom(name: '_OrcamentoControllerBase.texto');

  @override
  String get texto {
    _$textoAtom.reportRead();
    return super.texto;
  }

  @override
  set texto(String value) {
    _$textoAtom.reportWrite(value, super.texto, () {
      super.texto = value;
    });
  }

  final _$listItensAtom = Atom(name: '_OrcamentoControllerBase.listItens');

  @override
  List<ItemModel> get listItens {
    _$listItensAtom.reportRead();
    return super.listItens;
  }

  @override
  set listItens(List<ItemModel> value) {
    _$listItensAtom.reportWrite(value, super.listItens, () {
      super.listItens = value;
    });
  }

  final _$valorTotalAtom = Atom(name: '_OrcamentoControllerBase.valorTotal');

  @override
  double get valorTotal {
    _$valorTotalAtom.reportRead();
    return super.valorTotal;
  }

  @override
  set valorTotal(double value) {
    _$valorTotalAtom.reportWrite(value, super.valorTotal, () {
      super.valorTotal = value;
    });
  }

  final _$colorCabecalioAtom =
      Atom(name: '_OrcamentoControllerBase.colorCabecalio');

  @override
  Colors get colorCabecalio {
    _$colorCabecalioAtom.reportRead();
    return super.colorCabecalio;
  }

  @override
  set colorCabecalio(Colors value) {
    _$colorCabecalioAtom.reportWrite(value, super.colorCabecalio, () {
      super.colorCabecalio = value;
    });
  }

  final _$colorRodapeAtom = Atom(name: '_OrcamentoControllerBase.colorRodape');

  @override
  Colors get colorRodape {
    _$colorRodapeAtom.reportRead();
    return super.colorRodape;
  }

  @override
  set colorRodape(Colors value) {
    _$colorRodapeAtom.reportWrite(value, super.colorRodape, () {
      super.colorRodape = value;
    });
  }

  final _$colorBaseAtom = Atom(name: '_OrcamentoControllerBase.colorBase');

  @override
  Colors get colorBase {
    _$colorBaseAtom.reportRead();
    return super.colorBase;
  }

  @override
  set colorBase(Colors value) {
    _$colorBaseAtom.reportWrite(value, super.colorBase, () {
      super.colorBase = value;
    });
  }

  final _$colorLetraAtom = Atom(name: '_OrcamentoControllerBase.colorLetra');

  @override
  Colors get colorLetra {
    _$colorLetraAtom.reportRead();
    return super.colorLetra;
  }

  @override
  set colorLetra(Colors value) {
    _$colorLetraAtom.reportWrite(value, super.colorLetra, () {
      super.colorLetra = value;
    });
  }

  final _$nomeAtom = Atom(name: '_OrcamentoControllerBase.nome');

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

  final _$nomeControllerAtom =
      Atom(name: '_OrcamentoControllerBase.nomeController');

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

  final _$observacaoAtom = Atom(name: '_OrcamentoControllerBase.observacao');

  @override
  String get observacao {
    _$observacaoAtom.reportRead();
    return super.observacao;
  }

  @override
  set observacao(String value) {
    _$observacaoAtom.reportWrite(value, super.observacao, () {
      super.observacao = value;
    });
  }

  final _$observacaoControllerAtom =
      Atom(name: '_OrcamentoControllerBase.observacaoController');

  @override
  TextEditingController get observacaoController {
    _$observacaoControllerAtom.reportRead();
    return super.observacaoController;
  }

  @override
  set observacaoController(TextEditingController value) {
    _$observacaoControllerAtom.reportWrite(value, super.observacaoController,
        () {
      super.observacaoController = value;
    });
  }

  final _$categoriasProjetoAtom =
      Atom(name: '_OrcamentoControllerBase.categoriasProjeto');

  @override
  List<String> get categoriasProjeto {
    _$categoriasProjetoAtom.reportRead();
    return super.categoriasProjeto;
  }

  @override
  set categoriasProjeto(List<String> value) {
    _$categoriasProjetoAtom.reportWrite(value, super.categoriasProjeto, () {
      super.categoriasProjeto = value;
    });
  }

  @override
  String toString() {
    return '''
texto: ${texto},
listItens: ${listItens},
valorTotal: ${valorTotal},
colorCabecalio: ${colorCabecalio},
colorRodape: ${colorRodape},
colorBase: ${colorBase},
colorLetra: ${colorLetra},
nome: ${nome},
nomeController: ${nomeController},
observacao: ${observacao},
observacaoController: ${observacaoController},
categoriasProjeto: ${categoriasProjeto}
    ''';
  }
}
