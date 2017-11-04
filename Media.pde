void CambiarPista() {
  if (ColaPista.size() > 0) {
    Pista PistaActual = ColaPista.get(0);
    //println("Cantidad Falta "+ColaPista.size());
    if (!PistaActual.Reproduciendo) {
      PistaActual.Reproducir();
    } else if (PistaActual.Termino()) {
      println("Quitar Pista");
      ColaPista.get(0).Reproduciendo = false;
      ColaPista.remove(0);
    } else {
      //println("Falta: "+PistaActual.TiempoFalta());
    }
  }
}