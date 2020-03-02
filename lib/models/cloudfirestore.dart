import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syslist/models/aluno.dart';

class BancoFirebase {
  Firestore fire;
  BancoFirebase(this.fire);

  // Future<void> getAll() async {
  //   List<Map<String, dynamic>> lists = [];
  //   List<DocumentSnapshot> s = [];
  //   var a = fire.collection('alunos');
  //   // if (a == null) return;
  //   var b = a.snapshots();
  //   // if (await b.isEmpty) return;
  //   // if (b == null) return [];
  //   var element = await b.first;
  //   s = element.documents;
  //   for (var i in s) {
  //     Map<String, dynamic> row = ({'id': i.documentID});
  //     row.addAll(i.data);
  //     lists.add(i.data);
  //     print(row);
  //     print(i.data);
  //   }
  //   // return lists != null ? lists : [];
  // }

  updateAluno(String id, Map<String, dynamic> row) {
    fire.collection('alunos').document(id).updateData(row);
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    List<Map<String, dynamic>> lists = [];
    List<DocumentSnapshot> s = [];
    var a = fire.collection('alunos').orderBy('turma');
    if (a == null) return [];
    var b = a.snapshots();
    if (await b.isEmpty) return [];
    if (b == null) return [];
    var element = await b.first;
    s = element.documents;
    for (var i in s) {
      Map<String, dynamic> row = ({'id': i.documentID});
      row.addAll(i.data);
      lists.add(row);
    }
    return lists != null ? lists : [];
  }

  void add(Map<String, dynamic> row) {
    fire.collection('alunos').add(row);
  }

  void delete(Map<String, dynamic> row) {
    fire.collection('alunos').document(row['id']).delete();
  }

  void deleteforId(id) {
    fire.collection('alunos').document(id).delete();
  }

  Future<void> deleteAll(List<Aluno> alunos) async {
    for (var a in alunos) {
      var al = a.toJson();
      fire.collection('alunos').document(al['id']).delete();
    }
  }
}
