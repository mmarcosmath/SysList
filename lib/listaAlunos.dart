import 'package:flutter/material.dart';
import 'package:sislist/main.dart';
import 'package:sislist/models/aluno.dart';
import 'package:sislist/models/simpleDataBase.dart';

class ListaAlunos extends StatefulWidget {
  List<Aluno> alunos;

  ListaAlunos() {
    alunos = [];
  }
  @override
  _ListaAlunosState createState() => _ListaAlunosState();
}

class _ListaAlunosState extends State<ListaAlunos> {
  final bd = SimpleDataBase.instance;
  ScrollController controller = ScrollController();

  _list() async {
    List<Aluno> alunos = await bd.getall();
    setState(() {
      widget.alunos = alunos;
    });
  }

  _ListaAlunosState() {
    _list();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CC5')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () async {
              await bd.deleteTable();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarregaCsv(),
                ),
              );
              print("iu");
              _list();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _list();
        },
        child: ListView.builder(
            controller: controller,
            itemCount: widget.alunos.length,
            itemBuilder: (BuildContext context, int index) {
              var aluno = widget.alunos[index];
              return Card(
                child: CheckboxListTile(
                  title: Text(aluno.nome),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(aluno.matricula),
                      Text(aluno.turma),
                    ],
                  ),
                  value: aluno.presente,
                  onChanged: (value) {
                    setState(() {
                      aluno.presente = value;
                    });
                  },
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          // for (var i = 0; i < 10; i++) {
          //   setState(() {
          //     widget.alunos.add(Aluno(
          //         nome: 'Marcos Matheus Nascimento Silva',
          //         matricula: '20181BCC.CAX0019',
          //         presente: false,
          //         turma: 'CC5'));
          //   });
          // }
        },
      ),
    );
  }
}
