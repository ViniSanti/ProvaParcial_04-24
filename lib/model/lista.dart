import 'item.dart';

class Lista {
  String nome;
  List<Item> itens;

  Lista(this.nome, this.itens);

  factory Lista.fromJson(Map json) {
    var nome = json['nome'];
    var itensJson = json['itens'] as List<dynamic>;
    
    List<Item> items = [];
    for (var itemJson in itensJson) {
      items.add(Item.fromJson(itemJson));
    }
    return Lista(nome, items);
  }
}