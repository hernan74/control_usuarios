
class Usuarios {
  final String uniqueId;
  final String fotoUrl;
  final String apyNom;
  final String direccion;
  final bool sincronizado;

  Usuarios({this.uniqueId, this.fotoUrl, this.apyNom, this.direccion,
      this.sincronizado});
}

List<Usuarios> listaUsuarios = [
  Usuarios(
    uniqueId    : 'hernan',
    fotoUrl     : 'assets/avatar.png',
    apyNom      : 'Hernan Daniel Lopez erew',
    direccion   : 'Km 10, Eldorado, Misiones werewr ewfsf dsa',
    sincronizado: true,
  ),
  Usuarios(
    uniqueId    : 'juanito',
    fotoUrl     : 'assets/avatar.jpg',
    apyNom      : 'Juanito Perez',
    direccion   : 'km 6, Eldorado, Misiones',
    sincronizado: false,
  ),
  Usuarios(
    uniqueId    : 'maria',
    fotoUrl     : 'assets/avatar.png',
    apyNom      : 'Maria Martinez',
    direccion   : 'km 11, Eldorado, Misiones',
    sincronizado: false,
  ),
 
];
