class Category {
  int? id;
  String? nome;
  String? DataCriacao;

  Category({
    this.id,
     this.DataCriacao,
     this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'DataCriacao': DataCriacao,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      DataCriacao: map['DataCriacao'],
      nome: map['nome'],
    );
  }
}