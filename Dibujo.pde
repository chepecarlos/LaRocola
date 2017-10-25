PImage img; //<>//
int[] IndiceAlbun = {0, 0};

void Fondo() {
  Ancho =  width;
  Alto = height;
  //if (EstadoReproducion == 0 ) {
  //background(240);
  img = loadImage("FONDO-ROKOLA.png");
  img.resize(int(Ancho), int(Alto));
  background(img);
  //} else if (   EstadoReproducion == 1) {
  //Codigo
  // background(240);
  //} else if (EstadoReproducion == 2) {
  //  ActualizarVideo();
  //  println(frameRate);
  //}
}

void DibujarAlbunes() {
  float AnchoAlbunes = Alto*0.525;
  float AnchoCelda = AnchoAlbunes*(0.1);
  int TamanoFunte = int(AnchoCelda - AnchoCelda/10);
  textFont(FuenteAlbun);
  pushMatrix();
  textSize(TamanoFunte);
  textAlign(LEFT, TOP);
  translate( Ancho*(0.23), Alto - AnchoAlbunes- Alto*0.03);
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
      rect(0, i*AnchoCelda, Ancho*(0.235), AnchoCelda);
      fill(255);
    } else {
      fill(46);
    }
    NombreAlbun = NombreAlbun.toLowerCase();
    if (NombreAlbun.length() > 20 ) {
      NombreAlbun  = NombreAlbun.substring(0, 20)+"...";
    }
    text(" "+NombreAlbun, 0, AnchoCelda*i);
    Indice++;
    if (Indice >= Biblioteca.size() ) {
      popMatrix();
      return;
    }
  }
  popMatrix();
}

void DibujarLista() {
  float AnchoAlbunes = Alto*0.52;
  float AnchoCelda = AnchoAlbunes/10;
  float AnchoCel = Ancho*0.275;
  int TamanoFunte = int(AnchoCelda -AnchoCelda/10);
  pushMatrix();
  textSize(TamanoFunte);
  textAlign(LEFT, TOP);
  fill(18, 10, 60);
  translate( Ancho*0.720, Alto*0.45);
  //rect(0, 0, AnchoCel, AnchoAlbunes);
  fill(255);
  if (ColaPista.size()> 0) {
    for (int i = 0; i< 10; i++) {
      if (ColaPista.size() > i ) {
        Pista PistaActual = ColaPista.get(i);
        String PistaNombre =  PistaActual.NombrePista.toLowerCase();
        if (PistaNombre.length() > 20 ) {
          PistaNombre  = PistaNombre.substring(0, 20)+"...";
        }
        text((i+1)+" "+PistaNombre, 0, AnchoCelda*i);
      }
    }
  }
  popMatrix();
}


void DibujarPistas() {
  float AnchoAlbunes = Alto*0.51;
  float AnchoAlbun = Ancho*0.222;
  float AnchoCelda = AnchoAlbunes*0.10;
  int TamanoFunte = int(AnchoCelda -AnchoCelda/10);
  pushMatrix();
  textSize(TamanoFunte*0.8);
  textAlign(LEFT, TOP);
  fill(231);
  translate( Ancho*0.476, Alto * 0.455);
  rect(0, 0, AnchoAlbun, AnchoAlbunes);
  fill(0);
  if (PunteroActual[1] >=IndiceAlbun[1] +10 ) {
    IndiceAlbun[1]++;
  } else if (PunteroActual[1] <IndiceAlbun[1] ) {
    IndiceAlbun[1]--;
  }
  int Indice = IndiceAlbun[1];
  for (int i = 0; i< 10; i++) {
    String NombrePista = AlbunActual.get(Indice).NombrePista;
    if (Indice == PunteroActual[1]) {
      fill(226, 117, 15);
      rect(0, i*AnchoCelda, AnchoAlbun, AnchoCelda);
    } 
    fill(0);
    NombrePista = NombrePista.toLowerCase();
    if (NombrePista.length() > 15 ) {
      NombrePista = NombrePista.substring(0, 15)+"...";
    }
    text((i+1)+" "+NombrePista, AnchoAlbunes/20, AnchoCelda*i);
    Indice++;
    if (Indice >= AlbunActual.CantidadPistas ) {
      popMatrix();
      return;
    }
  }
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
  textFont(FuenteIndice);
  pushMatrix();
  textSize(TamanoFunte);
  textAlign(LEFT, TOP);
  translate( 0, Alto- Alto/15-Alto/60);
  noStroke();
  fill(0);
  text(" $ "+Saldo, 0, 0);
  // float TiempoFaltante = frameRate;
  fill(0);
  int Segundo = TiempoRestante% 60;
  int Minuto = (TiempoRestante-Segundo)/60;
  // TiempoRestante-Minuto;
  text(Minuto+":"+Segundo, Ancho/10, 0);
  popMatrix();
}

/*
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
 */
void ActualizarVideo() {
  if (EstadoReproducion == 2) {
    Pelicula.read();
    image(Pelicula, 0, 0, width, height);
  }
}

void DibujarVercion() {
  pushMatrix();
  int TamanoFunte = int(Alto/60);
  textSize(TamanoFunte);
  translate( Ancho - Ancho*0.06, 0);
  fill(100);
  text("Vercion "+Vercion, 0, 0);
  popMatrix();
}


void Sueno() {
  if (millis() - TiempoPasado > 5000) {
    Dormir = true;
  }
}