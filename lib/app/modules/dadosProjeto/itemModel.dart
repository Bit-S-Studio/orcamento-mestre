import 'dart:convert';

class ItemModel {
  final String descricao;
  final double valor;
  final String categoria;
  final String tempo;
  final String medida;
  final double quantidade;
  final double valorTotal;
  ItemModel(
      {this.medida,
      this.quantidade,
      this.tempo,
      this.descricao,
      this.valor,
      this.categoria,
      this.valorTotal});

  factory ItemModel.fromJson(String str) => ItemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemModel.fromMap(Map<String, dynamic> json) => ItemModel(
        descricao: json["descricao"],
        categoria: json["categoria"],
        valor: json["valor"],
        tempo: json["tempo"],
        medida: json["medida"],
        quantidade: json["quantidade"],
        valorTotal: json["valorTotal"],
      );

  Map<String, dynamic> toMap() => {
        "descricao": descricao,
        "categoria": categoria,
        "valor": valor,
        "tempo": tempo,
        "medida": medida,
        "quantidade": quantidade,
        "valorTotal": valorTotal,
      };
  ItemModel copyWith(
          {String descricao,
          double valor,
          String categoria,
          String tempo,
          String medida,
          double quantidade,
          double valorTotal}) =>
      ItemModel(
          descricao: descricao ?? this.descricao,
          categoria: categoria ?? this.categoria,
          valor: valor ?? this.valor,
          tempo: tempo ?? this.tempo,
          medida: medida ?? this.medida,
          quantidade: quantidade ?? this.quantidade,
          valorTotal: valorTotal ?? this.valorTotal);
}
