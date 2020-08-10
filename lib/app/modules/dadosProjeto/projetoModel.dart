class ProjetoModel {
  int categoria;
  int item;

  ProjetoModel({this.categoria, this.item});

  factory ProjetoModel.fromJson(Map<dynamic, dynamic> json) {
    return new ProjetoModel(
      categoria: json['categoria'],
      item: json['item'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['categoria'] = this.categoria;
    data['item'] = this.item;
    return data;
  }
}
