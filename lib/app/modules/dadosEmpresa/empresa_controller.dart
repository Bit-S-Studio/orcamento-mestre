import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'empresa_controller.g.dart';

class EmpresaController = _EmpresaControllerBase with _$EmpresaController;

abstract class _EmpresaControllerBase with Store {
  @observable
  TextEditingController nameEmpresa = TextEditingController();

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
    } catch (e) {}
    (imageFile != null) ? logoStatus = true : logoStatus = false;
    return imageFile;
  }
}
