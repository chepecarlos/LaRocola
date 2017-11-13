class Puntero {
  int Pista;
  int Albun;
  int Genero;

  Puntero() {
    Pista = 0;
    Albun = 0;
    Genero = 0;
  }

  Puntero(int v) {
    Pista = v;
    Albun = v;
    Genero = v;
  }

  boolean Diferente(Puntero P) {
    if (P.Pista != this.Pista) {
      return true;
    } else if (P.Genero != this.Genero) {
      return true;
    } else if (P.Albun != this.Albun) {
      return true;
    }
    return false;
  }
  
  void Asignar(Puntero P){
  this.Pista = P.Pista;
  this.Genero = P.Genero;
  this.Albun = P.Albun;
  }
}