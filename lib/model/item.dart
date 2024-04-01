class Item {
  String nome;
  String quantidade;
  String categoria;
  String notas;
  bool status;
  Item(this.nome, this.quantidade, this.categoria, this.notas, this.status);
  factory Item.fromJson(Map json) {
    return Item(
      json['nome'], 
      json['quantidade'],
      json['categoria'],
      json['notas'],
      json['status']
      );
  }
}