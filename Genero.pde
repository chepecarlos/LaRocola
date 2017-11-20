class Genero {
  int CantidadArtista;
  int CantidadCanciones;
  String NombreGenero;
  String DirecionGenero  = null;
  String DirecionImagen;
  ArrayList<Albun> ListaAlbunes = new ArrayList<Albun>();

  Genero(String Genero, String Direcion) {
    NombreGenero = Genero;
    DirecionGenero = Direcion;
    CantidadArtista = 0;
    CantidadCanciones = 0;
  }

  void add(Albun AlbunAcual) {
    CantidadArtista++;
    CantidadCanciones += AlbunAcual.CantidadPistas;
    ListaAlbunes.add(AlbunAcual);
  }

  Albun get(int i) {
    return ListaAlbunes.get(i);
  }
}