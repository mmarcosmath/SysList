import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syslist/models/aluno.dart';
import 'package:syslist/models/cloudfirestore.dart';
import 'package:syslist/pages/selectFile.dart';

class ListaAlunos extends StatefulWidget {
  List<Aluno> alunos;

  ListaAlunos() {
    alunos = [];
  }
  @override
  ListaAlunosState createState() => ListaAlunosState();
}

class ListaAlunosState extends State<ListaAlunos> {
  ScrollController controller = ScrollController();
  BancoFirebase fire;

  _load() async {
    widget.alunos.clear();
    var alunos = await fire.getAll();

    // print(await fire.getAll());
    if ((alunos != null) || (alunos.isEmpty)) {
      // print(alunos.toString());
      setState(() {
        for (var a in alunos) {
          // print(a);
          widget.alunos.add(Aluno.fromJson(a));
        }
      });
    }
  }

  // Future<List<Aluno>> vv() async {
  //   var alunos = await fire.getAll();
  //   List<Aluno> temp = [];
  //   if ((alunos != null) || (alunos.isEmpty)) {
  //     for (var a in alunos) {
  //       print(a);
  //       temp.add(Aluno.fromJson(a));
  //     }
  //   }
  //   return temp;
  // }

  ListaAlunosState() {
    fire = BancoFirebase(Firestore.instance);
  }
  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CC5')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              await _load();
            },
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () async {
              await fire.deleteAll(widget.alunos);
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarregaCsv(),
                ),
              );
              print("iu");
              await _load();
            },
          ),
        ],
      ),
      body:
          //  StreamBuilder(
          //   stream: fire.fire.collection('alunos').snapshots(),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {

          //     if (snapshot.hasError) return Text("Erro");
          //     switch (snapshot.connectionState) {
          //       case ConnectionState.waiting:
          //         return LinearProgressIndicator();
          //         break;
          //       default:
          //         return Center(
          //           child: ListView(
          //             children: snapshot.data.documents
          //                 .map<Widget>((DocumentSnapshot doc) {
          //               return CheckboxListTile(
          //                 title: Text(doc.data['nome']),
          //                 subtitle: Text(doc.data['matricula']),
          //                 value: doc.data['presente'],
          //                 onChanged: (value) {
          //                   String id = doc.documentID;
          //                   Firestore.instance
          //                       .collection('alunos')
          //                       .document(id)
          //                       .updateData({'presente':value});

          //                       _load();
          //                     // fire.deleteforId(id);
          //                   // fire.updateAluno(id, {
          //                   //   'matricula': '20181BCC.CAX0019',
          //                   //   'nome': 'Marcos Matheus',
          //                   //   'turma': 'CC5',
          //                   //   'presente': true
          //                   // });
          //                   // print(doc.data);
          //                 },
          //               );
          //             }).toList(),
          //           ),
          //         );
          //     }
          //   },
          // ),
          (widget.alunos.length == 0)
              ? LinearProgressIndicator()
              : ListView.builder(
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
