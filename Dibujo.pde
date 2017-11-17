PImage img; //<>//
PImage ImgGenero;

void Fondo() {
  Ancho =  width;
  Alto = height;
  if (!VideoCompleto) {
    img = loadImage("FONDO-ROKOLA.png");
    //img = loadImage("fondo.png");
    img.resize(int(Ancho), int(Alto));
    background(img);
  }
  fill(255, 0, 0);
  rect(0.719*Ancho, 0.14*Alto, 0.279*Ancho, 0.005*Alto);
}

void DibujarGenero() {
 
  
  if (PunteroActual.Genero - 2 >= 0) {
    DibujarPortada(0.10, 0.043, 0.173, BibliotecaPista.get(PunteroActual.Genero-2).DirecionImagen);
  }
  if (PunteroActual.Genero + 2 < BibliotecaPista.size()) {
    DibujarPortada(0.10, 0.56, 0.173, BibliotecaPista.get(PunteroActual.Genero+2).DirecionImagen);
  }
  if (PunteroActual.Genero - 1 >= 0) {
    DibujarPortada(0.14, 0.14, 0.13, BibliotecaPista.get(PunteroActual.Genero-1).DirecionImagen);
  }
  if (PunteroActual.Genero + 1 < BibliotecaPista.size()) {
    DibujarPortada(0.14, 0.425, 0.13, BibliotecaPista.get(PunteroActual.Genero+1).DirecionImagen);
  }
  DibujarPortada(0.1708, 0.2675, 0.088, BibliotecaPista.get(PunteroActual.Genero).DirecionImagen);
  textAlign(CENTER);
  text(BibliotecaPista.get(PunteroActual.Genero).NombreGenero, 0.356*Ancho, 0.07*Alto);
}

void DibujarPortada(float Tamano, float X, float Y, String Direcion) {
  PImage ImgPortada;
  ImgPortada = loadImage(Direcion);
  float AnchoImagen = Tamano*Ancho;
  float AltoImagen = (AnchoImagen*ImgPortada.pixelHeight)/ImgPortada.pixelWidth;
  ImgPortada.resize(int(AnchoImagen), int(AltoImagen));
  image(ImgPortada, X*Ancho, Y*Alto);
}


void DibujarAlbunes() {
 float Posixion;
  Posixion = mouseX/Ancho;
  if ( Posixion < 0.001) {
    Posixion = 1;
  }
  println("I:"+PunteroActual.Genero+" P:"+Posixion);

  DibujarPortada(0.1658 , 0.0308, 0.468, AlbunActual.DirecionImagen);
  float AnchoAlbunes = Alto*0.525;
  float AnchoCelda = AnchoAlbunes*(0.1);
  int TamanoFunte = int(AnchoCelda - AnchoCelda/10);
  textFont(FuenteAlbun);
  pushMatrix();
  textSize(TamanoFunte);
  textAlign(LEFT, TOP);
  translate( Ancho*(0.23), Alto - AnchoAlbunes- Alto*0.03);
  fill(0);
  if (PunteroActual.Albun >= PunteroMenu.Albun +10 ) {
    PunteroMenu.Albun++;
  } else if (PunteroActual.Albun < PunteroMenu.Albun ) {
    PunteroMenu.Albun --;
  }
  int Indice = PunteroMenu.Albun;
  for (int i =0; i< 10; i++) {
    String NombreAlbun = GeneroActual.get(Indice).NombreAlbun;
    if (Indice == PunteroActual.Albun) {
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
    if (Indice >= GeneroActual.CantidadAlbunes ) {
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
  noStroke();
  rect(0, 0, AnchoAlbun, AnchoAlbunes);
  fill(0);
  if (PunteroActual.Pista >= PunteroMenu.Pista +10 ) {
    PunteroMenu.Pista++;
  } else if (PunteroActual.Pista < PunteroMenu.Pista ) {
    PunteroMenu.Pista--;
  }
  int Indice = PunteroMenu.Pista;
  for (int i = 0; i< 10; i++) {
    String NombrePista = AlbunActual.get(Indice).NombrePista;
    if (Indice == PunteroActual.Pista) {
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
  int TamanoFunte = int(Alto/20);
  textFont(FuenteIndice);
  pushMatrix();
  textSize(TamanoFunte);
  textAlign(LEFT, TOP);
  translate( 0, Alto- Alto/15-Alto/60);
  noStroke();
  fill(0);
  text(" $ "+Saldo, 0, TamanoFunte/3);
  fill(255);
  int Segundo = TiempoRestante% 60;
  int Minuto = (TiempoRestante-Segundo)/60;
  // TiempoRestante-Minuto;
  if (Segundo < 10) {
    text(Minuto+":0"+Segundo, Ancho/8, TamanoFunte/3);
  } else {
    text(Minuto+":"+Segundo, Ancho/8, TamanoFunte/3);
  }
  popMatrix();
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
  if (millis() - TiempoPasado > 10000) {
    //println( "Tiempo :"+( millis() - TiempoPasado));
    VideoCompleto = true;
  }
}

void DibujarBarraReproducion() {
  pushStyle();
  pushMatrix();
  if (!VideoCompleto) {
    float AnchoBarra = 0.279*Ancho;
    if (TiempoPasado > 0 && TiempoPista > 0) {
      if (ColaPista.size()> 0) {
        float AnchoActual = map( TiempoRestante, 0, TiempoPista, AnchoBarra, 0);
        fill(200, 200, 0);
        rect(0.719*Ancho, 0.14*Alto, AnchoActual, 0.005*Alto);
      }
    }
  }
  popMatrix();
  popStyle();
}