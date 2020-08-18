// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
  final _$firebaseAuthAtom = Atom(name: '_UserControllerBase.firebaseAuth');

  @override
  FirebaseAuth get firebaseAuth {
    _$firebaseAuthAtom.reportRead();
    return super.firebaseAuth;
  }

  @override
  set firebaseAuth(FirebaseAuth value) {
    _$firebaseAuthAtom.reportWrite(value, super.firebaseAuth, () {
      super.firebaseAuth = value;
    });
  }

  final _$logadoAtom = Atom(name: '_UserControllerBase.logado');

  @override
  bool get logado {
    _$logadoAtom.reportRead();
    return super.logado;
  }

  @override
  set logado(bool value) {
    _$logadoAtom.reportWrite(value, super.logado, () {
      super.logado = value;
    });
  }

  final _$currentUserAtom = Atom(name: '_UserControllerBase.currentUser');

  @override
  FirebaseUser get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(FirebaseUser value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$uidAtom = Atom(name: '_UserControllerBase.uid');

  @override
  String get uid {
    _$uidAtom.reportRead();
    return super.uid;
  }

  @override
  set uid(String value) {
    _$uidAtom.reportWrite(value, super.uid, () {
      super.uid = value;
    });
  }

  final _$nomeAtom = Atom(name: '_UserControllerBase.nome');

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

  final _$imagemAtom = Atom(name: '_UserControllerBase.imagem');

  @override
  String get imagem {
    _$imagemAtom.reportRead();
    return super.imagem;
  }

  @override
  set imagem(String value) {
    _$imagemAtom.reportWrite(value, super.imagem, () {
      super.imagem = value;
    });
  }

  final _$emailAtom = Atom(name: '_UserControllerBase.email');

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

  final _$senhaAtom = Atom(name: '_UserControllerBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$planoAtom = Atom(name: '_UserControllerBase.plano');

  @override
  String get plano {
    _$planoAtom.reportRead();
    return super.plano;
  }

  @override
  set plano(String value) {
    _$planoAtom.reportWrite(value, super.plano, () {
      super.plano = value;
    });
  }

  final _$telefoneAtom = Atom(name: '_UserControllerBase.telefone');

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

  final _$tipoAtom = Atom(name: '_UserControllerBase.tipo');

  @override
  String get tipo {
    _$tipoAtom.reportRead();
    return super.tipo;
  }

  @override
  set tipo(String value) {
    _$tipoAtom.reportWrite(value, super.tipo, () {
      super.tipo = value;
    });
  }

  final _$setUserAsyncAction = AsyncAction('_UserControllerBase.setUser');

  @override
  Future<bool> setUser() {
    return _$setUserAsyncAction.run(() => super.setUser());
  }

  final _$setUidAsyncAction = AsyncAction('_UserControllerBase.setUid');

  @override
  Future<String> setUid() {
    return _$setUidAsyncAction.run(() => super.setUid());
  }

  final _$getUserAsyncAction = AsyncAction('_UserControllerBase.getUser');

  @override
  Future<dynamic> getUser(String id) {
    return _$getUserAsyncAction.run(() => super.getUser(id));
  }

  @override
  String toString() {
    return '''
firebaseAuth: ${firebaseAuth},
logado: ${logado},
currentUser: ${currentUser},
uid: ${uid},
nome: ${nome},
imagem: ${imagem},
email: ${email},
senha: ${senha},
plano: ${plano},
telefone: ${telefone},
tipo: ${tipo}
    ''';
  }
}
