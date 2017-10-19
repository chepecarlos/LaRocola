PImage img;
int[] IndiceAlbun = {0, 10};
void Fondo() {
  Ancho =  width;
  Alto = height;
  if (EstadoReproducion == 0 ) {
    //background(240);
    img = loadImage("fondo.png");
    img.resize(int(Ancho), int(Alto));
    background(img);
  } else if (   EstadoReproducion == 1) {
    //Codigo
    background(240);
  } else if (EstadoReproducion == 2) {
    ActualizarVideo();
    println(frameRate);
  }
}

void DibujarAlbunes() {
  float AnchoAlbunes = Alto*0.56;
  float AnchoCelda = AnchoAlbunes/10;
  int TamanoFunte = int(AnchoCelda -AnchoCelda/10);
  pushStyle();
  pushMatrix();
  textSize(TamanoFunte);
  textAlign(LEFT, TOP);
  fill(231);
  translate( Ancho/4, Alto - AnchoAlbunes);
  rect(0, 0, Ancho/4, AnchoAlbunes);
  fill(0);
  if (PunteroActual[0] >=IndiceAlbun[0] +10 ) {
    IndiceAlbun[0] ++;
  } else if (PunteroActual[0] <IndiceAlbun[0] ) {
    IndiceAlbun[0] --;
  }
  int Indice = IndiceAlbun[0];
  for (int i =0; i< 10; i++) {
    String NombreAlbun = Biblioteca.get(Indice).NombreAlbun;
    if (Indice == PunteroActual[0]) {
      fill(0, 115, 216);
      rect(0, i*AnchoCelda, Ancho/4, AnchoCelda);
      fill(255);
    } else {
      fill(0);
    }
    text(NombreAlbun, AnchoAlbunes/20, AnchoCelda*i);
    Indice++;
    if (Indice >= Biblioteca.size() ) {
      return;
    }
  }
  popStyle();
  popMatrix();
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
  int TamanoFunte = int(Alto/15);
  pushStyle();
  pushMatrix();
  textSize(TamanoFunte);
  textAlign(LEFT, TOP);
  translate( 0, Alto- Alto/15);
  noStroke();
  fill(154, 216, 0);
  rect(0, 0, Ancho/8, Alto/15);
  fill(0);
  text("$:"+int(Saldo), 0, 0);
  translate( Ancho/8, 0);
  fill(216, 5, 90);
  rect(0, 0, Ancho/8, Alto/15);
  float TiempoFaltante = 1.30;
  fill(0);
  text(TiempoFaltante, 0, 0);
  popMatrix();
  popStyle();
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
    for (int i =0; i<10; i++) {
      float PosicionY = map(i, 0, CantidadLista, Inicio, Final);
      fill(0);
      textAlign(LEFT, CENTER);
      textSize(50);
      //text("#"+ListaMedia.get(i), 20, PosicionY);
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