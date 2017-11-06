class Genero {
  int CantidadAlbunes;
  String NombreGenero;
  String DirecionGenero  = null;
  String DirecionImagen;
  ArrayList<Albun> ListaAlbunes = new ArrayList<Albun>();

  Genero(String Genero, String Direcion) {
    NombreGenero = Genero;
    DirecionGenero = Direcion;
    CantidadAlbunes = 0;
  }

  void add(Albun AlbunAcual) {
    CantidadAlbunes++;
    ListaAlbunes.add(AlbunAcual);
  }

  Albun get(int i) {
    return ListaAlbunes.get(i);
  }
}