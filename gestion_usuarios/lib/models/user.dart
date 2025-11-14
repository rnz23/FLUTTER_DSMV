class User {
  String nombre;
  String genero;
  bool activo;
  int edad;

  User({
    required this.nombre,
    required this.genero,
    required this.activo,
    required this.edad,
  });

  User copyWith({
    String? nombre,
    String? genero,
    bool? activo,
    int? edad,
  }) {
    return User(
      nombre: nombre ?? this.nombre,
      genero: genero ?? this.genero,
      activo: activo ?? this.activo,
      edad: edad ?? this.edad,
    );
  }
}