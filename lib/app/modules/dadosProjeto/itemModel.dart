import 'dart:convert';

class ItemModel {
  final String descricao;
  final double valor;
  final String categoria;
  final DateTime tempo;

  ItemModel({this.tempo, this.descricao, this.valor, this.categoria});

  factory ItemModel.fromJson(String str) => ItemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemModel.fromMap(Map<String, dynamic> json) => ItemModel(
        descricao: json["descricao"],
        categoria: json["categoria"],
        valor: json["valor"],
        tempo: json["tempo"],
      );

  Map<String, dynamic> toMap() => {
        "descricao": descricao,
        "categoria": categoria,
        "valor": valor,
        "tempo": tempo,
      };
  ItemModel copyWith({
    String descricao,
    double valor,
    String categoria,
    DateTime tempo,
  }) =>
      ItemModel(
        descricao: descricao ?? this.descricao,
        categoria: categoria ?? this.categoria,
        valor: valor ?? this.valor,
        tempo: tempo ?? this.tempo,
      );
}
