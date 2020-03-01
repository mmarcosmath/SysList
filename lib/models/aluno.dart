class Aluno {
  String id;
  String matricula;
  String nome;
  String turma;
  bool presente;

  Aluno({this.id, this.matricula, this.nome, this.turma, this.presente});

  Aluno.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matricula = json['matricula'];
    nome = json['nome'];
    turma = json['turma'];
    presente = json['presente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['matricula'] = this.matricula;
    data['nome'] = this.nome;
    data['turma'] = this.turma;
    data['presente'] = this.presente;
    return data;
  }
}
