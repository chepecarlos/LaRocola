


void Fondo() {
  background(240);
}

void Nombre() {
  int InicioLista;
  int FinalLista;

  String[] ListaMenu = new String[7];
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
    if (IDMenu[i] ==IDCancion) {
      println("Selecionada "+IDMenu[i]+ " nombre "+ListaMenu[i]);
    } else {
      println("ID "+IDMenu[i]+ " nombre "+ListaMenu[i]);
    }
    fill(0);
    text("ID:"+IDMenu[i]+"+"+ ListaMenu[i], 40, i*(Ancho/10));
  }
}