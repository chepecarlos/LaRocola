void Fondo() {
  Ancho =  width;
  Alto = height;
  if (EstadoReproducion == 0 ) {
    background(240);
  } else if (   EstadoReproducion == 1) {
    //Codigo
    background(240);
  } else if (EstadoReproducion == 2) {
    ActualizarVideo();
    println(frameRate);
  }
}

void DibujarVolumen() {
  fill(0);
  rect(Ancho- 400, 20, 200, 60, 40);
  fill(0, 255, 0);
  float AnchoVolumen = map(Volumen, 0, 100, 0, 200);
  rect(Ancho- 400, 20, AnchoVolumen, 60, 40);
  textAlign(LEFT, CENTER);
  fill(255);
  text("Volumen: "+int(Volumen), Ancho- 380, 50);
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
  if (!Dormir) {
    int CantidadLista = 9;
    ArrayList ListaMedia = new ArrayList();
    for (int i = 0; i< CantidadLista; i++) {
      int n = i + IDCancion - CantidadLista/2;
      if ( n > NombreCanciones.length -1 ) {
        n = n - NombreCanciones.length  ;
      } else if ( n < 0) {
        n = NombreCanciones.length + n;
      }
      ListaMedia.add(n);
    }
    //println(ListaMedia);
    float Inicio = Alto/8;
    float Final = Alto - Inicio;
    for (int i =0; i<CantidadLista; i++) {
      float PosicionY = map(i, 0, CantidadLista, Inicio, Final);
      fill(0);
      textAlign(LEFT, CENTER);
      textSize(50);
      text("#"+ListaMedia.get(i), 20, PosicionY);
      textSize(20);
    }
  }
}

void ActualizarVideo() {
  if (EstadoReproducion == 2) {
    Pelicula.read();
    image(Pelicula, 0, 0, width, height);
  }
}

void Sueno() {
  if (millis() - TiempoPasado > 5000) {
    Dormir = true;
  }
}