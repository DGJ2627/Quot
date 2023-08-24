class Qutoes_model {
  int id;
  String quote;
  String author;

  Qutoes_model({required this.id,required this.author, required this.quote});

  factory Qutoes_model.fromMap({required Map data}) {
    return Qutoes_model(id: data['id'],author: data['author'], quote: data['quote']);
  }
}
