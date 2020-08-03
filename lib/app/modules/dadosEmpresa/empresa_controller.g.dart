// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empresa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EmpresaController on _EmpresaControllerBase, Store {
  final _$nameEmpresaAtom = Atom(name: '_EmpresaControllerBase.nameEmpresa');

  @override
  TextEditingController get nameEmpresa {
    _$nameEmpresaAtom.reportRead();
    return super.nameEmpresa;
  }

  @override
  set nameEmpresa(TextEditingController value) {
    _$nameEmpresaAtom.reportWrite(value, super.nameEmpresa, () {
      super.nameEmpresa = value;
    });
  }

  final _$logoStatusAtom = Atom(name: '_EmpresaControllerBase.logoStatus');

  @override
  bool get logoStatus {
    _$logoStatusAtom.reportRead();
    return super.logoStatus;
  }

  @override
  set logoStatus(bool value) {
    _$logoStatusAtom.reportWrite(value, super.logoStatus, () {
      super.logoStatus = value;
    });
  }

  final _$imageAtom = Atom(name: '_EmpresaControllerBase.image');

  @override
  FileImage get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(FileImage value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$imageFileAtom = Atom(name: '_EmpresaControllerBase.imageFile');

  @override
  PickedFile get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(PickedFile value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  final _$pickerAtom = Atom(name: '_EmpresaControllerBase.picker');

  @override
  ImagePicker get picker {
    _$pickerAtom.reportRead();
    return super.picker;
  }

  @override
  set picker(ImagePicker value) {
    _$pickerAtom.reportWrite(value, super.picker, () {
      super.picker = value;
    });
  }

  final _$getImageAsyncAction = AsyncAction('_EmpresaControllerBase.getImage');

  @override
  Future<PickedFile> getImage() {
    return _$getImageAsyncAction.run(() => super.getImage());
  }

  @override
  String toString() {
    return '''
nameEmpresa: ${nameEmpresa},
logoStatus: ${logoStatus},
image: ${image},
imageFile: ${imageFile},
picker: ${picker}
    ''';
  }
}
