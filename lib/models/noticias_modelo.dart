class NoticiaModelo {
  String? titulo;
  String? resumen;
  String? url;
  NoticiaModelo({this.titulo, this.resumen, this.url});

  //gracias al metodo de factory puedes usar mas contructores.

  factory NoticiaModelo.fromJson(Map<String, dynamic> json) {
    return NoticiaModelo(
      url: json['url'],
      resumen: json['abstract'],
      titulo: json['title'],
    );
  }
}
