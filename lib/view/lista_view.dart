import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provaparcial/model/item.dart';
import 'package:provaparcial/model/lista.dart';

class ListaView extends StatefulWidget {
  const ListaView({Key? key}) : super(key: key);

  @override
  State<ListaView> createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> {
  TextEditingController _novaListaController = TextEditingController();
  TextEditingController _nomeItemController = TextEditingController();
  TextEditingController _quantidadeItemController = TextEditingController();
  TextEditingController _categoriaItemController = TextEditingController();
  TextEditingController _notasItemController = TextEditingController();

  TextEditingController _searchController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (text) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'Pesquisar',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listas.length,
              itemBuilder: (context, index) {
                return _buildListaContainer(listas[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _criarNovaLista(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen,
      ),
    );
  }

  Widget _buildListaContainer(Lista lista) {
    return GestureDetector(
      onLongPress: () {
        _mostrarOpcoesLista(context, lista);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '- ${lista.nome}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: lista.itens.where((item) {
                return item.nome.toLowerCase().contains(_searchController.text.toLowerCase());
              }).map((item) {
                String itemText = item.status ? '✓ ' : '-> ';
                itemText += '${item.nome}, ${item.quantidade}';
                if (item.categoria != null && item.categoria.isNotEmpty) {
                  itemText += '\ncategoria: ${item.categoria}';
                }
                if (item.notas != null && item.notas.isNotEmpty) {
                  itemText += '\nnota: ${item.notas}';
                }
                return GestureDetector(
                  onLongPress: () {
                    _mostrarOpcoesItem(context, lista, item);
                  },
                  onTap: () {
                    setState(() {
                      item.status = !item.status;
                    });
                  },
                  child: Text(
                    itemText,
                    style: TextStyle(
                      fontSize: 18,
                      color: item.status ? Colors.green : Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _criarNovaLista(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Criar Nova Lista'),
          content: TextField(
            controller: _novaListaController,
            decoration: InputDecoration(
              hintText: 'Digite o nome da nova lista',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_novaListaController.text.isNotEmpty) {
                  setState(() {
                    listas.add(Lista(_novaListaController.text, []));
                  });
                  Navigator.of(context).pop();
                  _novaListaController.clear();
                }
              },
              child: Text('Criar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarOpcoesLista(BuildContext context, Lista lista) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Opções da Lista'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Adicionar Item'),
                onTap: () {
                  Navigator.pop(context);
                  _adicionarItem(context, lista);
                },
              ),
              ListTile(
                title: Text('Renomear Lista'),
                onTap: () {
                  Navigator.pop(context);
                  _renomearLista(context, lista);
                },
              ),
              ListTile(
                title: Text('Apagar Lista'),
                onTap: () {
                  Navigator.pop(context);
                  _apagarLista(context, lista);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _renomearLista(BuildContext context, Lista lista) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController(text: lista.nome);
        return AlertDialog(
          title: Text('Renomear Lista'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Digite o novo nome da lista',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  setState(() {
                    lista.nome = controller.text;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _apagarLista(BuildContext context, Lista lista) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Apagar Lista'),
          content: Text('Tem certeza que deseja apagar a lista "${lista.nome}"?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  listas.remove(lista);
                });
                Navigator.of(context).pop();
              },
              child: Text('Apagar'),
            ),
          ],
        );
      },
    );
  }

  void _adicionarItem(BuildContext context, Lista lista) {
    _nomeItemController.clear();
    _quantidadeItemController.clear();
    _categoriaItemController.clear();
    _notasItemController.clear();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Item'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _nomeItemController,
                  decoration: InputDecoration(labelText: 'Nome'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _quantidadeItemController,
                  decoration: InputDecoration(labelText: 'Quantidade'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _categoriaItemController,
                  decoration: InputDecoration(labelText: 'Categoria (opcional)'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _notasItemController,
                  decoration: InputDecoration(labelText: 'Notas (opcional)'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_nomeItemController.text.isNotEmpty && _quantidadeItemController.text.isNotEmpty) {
                  setState(() {
                    lista.itens.add(
                      Item(
                        _nomeItemController.text,
                        _quantidadeItemController.text,
                        _categoriaItemController.text,
                        _notasItemController.text,
                        false,
                      ),
                    );
                  });
                  Navigator.of(context).pop();
                  _nomeItemController.clear();
                  _quantidadeItemController.clear();
                  _categoriaItemController.clear();
                  _notasItemController.clear();
                }
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarOpcoesItem(BuildContext context, Lista lista, Item item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Opções do Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Editar Item'),
                onTap: () {
                  Navigator.pop(context);
                  _editarItem(context, lista, item);
                },
              ),
              ListTile(
                title: Text('Remover Item'),
                onTap: () {
                  setState(() {
                    lista.itens.remove(item);
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(item.status ? 'Marcar como não comprado' : 'Marcar como comprado'),
                onTap: () {
                  setState(() {
                    item.status = !item.status;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _editarItem(BuildContext context, Lista lista, Item item) {
    _nomeItemController.text = item.nome;
    _quantidadeItemController.text = item.quantidade;
    _categoriaItemController.text = item.categoria ?? '';
    _notasItemController.text = item.notas ?? '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Item'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _nomeItemController,
                  decoration: InputDecoration(labelText: 'Nome'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _quantidadeItemController,
                  decoration: InputDecoration(labelText: 'Quantidade'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _categoriaItemController,
                  decoration: InputDecoration(labelText: 'Categoria (opcional)'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _notasItemController,
                  decoration: InputDecoration(labelText: 'Notas (opcional)'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_nomeItemController.text.isNotEmpty && _quantidadeItemController.text.isNotEmpty) {
                  setState(() {
                    item.nome = _nomeItemController.text;
                    item.quantidade = _quantidadeItemController.text;
                    item.categoria = _categoriaItemController.text.isNotEmpty ? _categoriaItemController.text : '';
                    item.notas = _notasItemController.text.isNotEmpty ? _notasItemController.text : '';
                  });
                  Navigator.of(context).pop();
                  _nomeItemController.clear();
                  _quantidadeItemController.clear();
                  _categoriaItemController.clear();
                  _notasItemController.clear();
                }
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  // Listas exemplo
  List<Lista> listas = [
    Lista('Kit semanas de prova', [
      Item('Chiclete trident', '1 caixa', '', 'Ajuda a ficar acordado', false),
      Item('Energético Monster', '6 latas', '', 'ajuda ainda mais a ficar acordado, por um preço', true),
      Item('Chocolate', '0.5 kg', 'guloseimas', 'Uma recompensa pra me manter motivado', false),
    ]),
    Lista('Faxina', [
      Item('Desinfetante', '2 L', '', '', true),
      Item('Detergente', '3 unidades', '', '', false),
    ]),
  ];
}

void main() {
  runApp(MaterialApp(
    home: ListaView(),
  ));
}
