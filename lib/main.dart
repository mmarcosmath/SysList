import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syslist/models/cloudfirestore.dart';
import 'package:syslist/pages/listaAlunos.dart';
import 'package:syslist/pages/registrarFalta.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListaAlunos(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   BancoFirebase fire;
//   _MyHomePageState() {
//     fire = BancoFirebase();
//   }

//   void getAll() async {
//     print(await fire.getAll());
//   }

//   void add() {
//     Map<String, dynamic> row = {
//       'matricula': '20181BCC.CAX0019',
//       'nome': 'Marcos Matheus',
//       'turma': 'CC5',
//       'presente': true
//     };
//     fire.add(row);
//   }

//   Future<void> delete() async {
//     var list = await fire.getAll();
//     fire.delete(list.first);
//   }

//   // List<Map<String, dynamic>> lists = [];
//   // List<DocumentSnapshot> s = [];
//   // List<QuerySnapshot> ss = [];

//   // Future<void> getAll() async {
//   //   var a = Firestore.instance.collection('alunos');
//   //   var b = a.snapshots();
//   //   lists.clear();

//   //   var element = await b.first;
//   //   this.s = element.documents;

//   //   for (var i in s) {
//   //     this.lists.add(i.data);
//   //   }
//   //   print(lists);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.radio_button_checked),
//             onPressed: () {
//               getAll();
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.perm_contact_calendar),
//             onPressed: () {
//               delete();
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.wifi_tethering),
//             onPressed: () {
//               add();
//             },
//           ),
//         ],
//       ),
//       body:
      //   StreamBuilder(
      //   stream: Firestore.instance.collection('alunos').snapshots(),
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
      //               return ListTile(
      //                 leading: Icon(
      //                   Icons.people,
      //                   size: 52,
      //                 ),
      //                 title: Text(doc.data['nome']),
      //                 subtitle: Text(doc.data['matricula']),
      //                 trailing: Text(doc.data['turma']),
      //               );
      //             }).toList(),
      //           ),
      //         );
      //     }
      //   },
      // )
//     );
//   }
// }
