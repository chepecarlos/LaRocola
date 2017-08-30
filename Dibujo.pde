void Fondo() {
  background(240);
}

void CantidadCreditos() {
  fill(0);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  rect(Ancho- 100, 50, 150, 60, 40);
  fill(255);
  textSize(22);
  text("Creditos: "+int(Saldo), Ancho- 100, 50);
  rectMode(CORNER);
}

void Nombre() {
  String[] ListaMenu = new String[7];
  float Inicio = Alto/8;
  float Final = Alto - Inicio;
  int[] IDMenu = new int[7];
  for (int i =0; i<7; i++) {
    int IdActual = IDCancion -3 + i;
    if (IdActual<0) {
      IDMenu[i] = NombreCanciones.length-1-i;
    } else if (IdActual> NombreCanciones.length-1) {
      IDMenu[i] = IdActual-(NombreCanciones.length-1);
    } else {
      IDMenu[i] = IdActual;
    }
    ListaMenu[i] = NombreCanciones[IDMenu[i]];
  }
  for (int i =0; i<7; i++) {
    float PosicionY = map(i, 0, 6, Inicio, Final);
    fill(0);
    textAlign(LEFT, CENTER);
    textSize(50);
    if (IDMenu[i] == IDCancion && Saldo>0) {
      rect(0, PosicionY-Inicio/2, Ancho, Inicio);
      fill(255, 0, 0);
      text("#"+(IDMenu[i]+1), 20, PosicionY);
      textSize(30);
      text(ListaMenu[i], 130, PosicionY);
    } else {
      text("#"+(IDMenu[i]+1), 20, PosicionY);
      textSize(20);
      text(ListaMenu[i], 130, PosicionY);
    }
  }
}