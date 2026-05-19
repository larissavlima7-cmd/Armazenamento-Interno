//modelagem de dados

class Nota{
  //atributos
  final int? id; //permitir que a variavel seja nula
  //em um primeiro momento a variavel é nula
  //somente quando cair no banco de dados irá receber um valor para o ID
  final String titulo;
  final String conteudo;

  //construtor
  Nota({this.id, required this.titulo, required this.conteudo});

  //metodos de serializção de dados (toMap() fromMap())

  //toMap()=> converter um obj da Classe Nota para Map de DB(inserir dados no DB)
  Map<String,dynamic> toMap(){
    return{
      "id":id, //mapeando as colunas do database com os atributos da classe
      "titulo":titulo,
      "conteudo":conteudo
    };
  }

  //Coverter o Map(vindo do DB)=> obj da classe Nota
  //para fazer o from vamos usar um factory
  factory Nota.fromMap(Map<String,dynamic> map){
    return Nota(
      id: map["id"] as int,//se está voltando do DataBase então já tem um ID
      titulo: map["titulo"] as String,
      conteudo: map["conteudo"] as String
    );
  }

  //metodo para imprimir dados
  @override
  String toString() {
    return "Nota{id: $id, título: $titulo, conteúdo: $conteudo}";
  }
}
