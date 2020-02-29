import 'package:cloud_firestore/cloud_firestore.dart';

class BancoFirebase {
  Firestore fire;
  BancoFirebase() {
    fire = Firestore.instance;
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    List<Map<String, dynamic>> lists = [];
    List<DocumentSnapshot> s = [];
    var a = fire.collection('alunos');
    var b = a.snapshots();
    lists.clear();
    s.clear();
    var element = await b.first;
    s = element.documents;
    for (var i in s) {
      Map<String, dynamic> row = ({'id': i.documentID});
      row.addAll(i.data);
      lists.add(row);
    }
    return lists;
  }

  void add(Map<String, dynamic> row) {
    fire.collection('alunos').add(row);
  }

  void delete(Map<String, dynamic> row) {
    fire.collection('alunos').document(row['id']).delete();
  }
}
