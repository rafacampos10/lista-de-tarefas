import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Lista de Tarefas"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField( //input de dados
              controller: _textEditingController,
            ),
            Container(
              height:400,
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(

              ), //faz a divisão e separando
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tarefas[index]),
                  onLongPress: (){ // remove um determinado item
                    setState(() {
                      tarefas.removeAt(index);
                    });
                  },
                );
              },
            )
            ),
          ],
        ),
      ),
      floatingActionButton:Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
      FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed:  (){
          if(_textEditingController.text.length > 0){
            setState(() {
              tarefas.add(_textEditingController.text);
            });
            _textEditingController.clear();
          }
        },
        child: Icon(Icons.add),
      ), //botão de adicionar
      FloatingActionButton(
      backgroundColor: Colors.red,
      onPressed:  (){
          setState(() {
            tarefas = [];
          });
          _textEditingController.clear();
      },
      child: Icon(Icons.clear),
    ),//botão de limpar
        ],
      ),
    );
  }
}
