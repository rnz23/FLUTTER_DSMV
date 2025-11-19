class User {
  String nombre;
  String genero;
  bool activo;
  int edad;
  String email; // NUEVO CAMPO

  User({
    required this.nombre,
    required this.genero,
    required this.activo,
    required this.edad,
    required this.email, // NUEVO CAMPO
  });

  User copyWith({
    String? nombre,
    String? genero,
    bool? activo,
    int? edad,
    String? email, // NUEVO CAMPO
  }) {
    return User(
      nombre: nombre ?? this.nombre,
      genero: genero ?? this.genero,
      activo: activo ?? this.activo,
      edad: edad ?? this.edad,
      email: email ?? this.email, // NUEVO CAMPO
    );
  }
}