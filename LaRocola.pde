String Vercion = "0.0.1";

//Objeto para Manejar Minin
Minim minim; 

boolean Dormir = true;
float TiempoPasado  = 0;

//Direcion de la musica
String RutaCanciones;
//Nombre de las cansiones del folder
String[] NombreCanciones;
ArrayList CancionesDespues;
//ID de la cansion actual
int IDCancion = 0;
//Valumen 0 - 100
float  Volumen = 50;
//Tamaño de la pantalla
float Ancho;
float Alto;
//Cuanto fondos hay 
float Saldo = 1;

int EstadoReproducion = 0;
PFont FuentaSimple;

PFont FuenteIndice;
PFont FuenteAlbun;

void setup() {
  size(1200, 600, P2D);
  //size(600, 300, P2D);
  surface.setResizable(true);

  FuenteIndice =  createFont("Anton.ttf", 100);
  FuenteAlbun  = createFont("Ubuntu-L.ttf", 100);

  // fullScreen();
  // Ancho =  width;
  // Alto = height;
  CancionesDespues = new ArrayList();
  RutaCanciones = sketchPath()+"/data";

  minim = new Minim(this);

  // println("Lista de Canciones");
  //NombreCanciones = ListaNombreArchivo(RutaCanciones);
  //printArray(NombreCanciones);
  //println("Cantidad de cansiones: "+ NombreCanciones.length);
  CargarAlbun("/home/chepecarlos/Musica");
}

void draw() {
  // float R = float(pixelWidth)/float(pixelHeight) ;
  // println("w:"+pixelWidth+" H:"+pixelHeight+" R:"+ R);  
  Fondo();
  //Nombre();
  DibujarAlbunes();
  DibujarPistas();
  DibujarLista();
  DibujarVercion();
  CantidadCreditos();
  //DibujarVolumen();
  CambiarPista();
  
  //Sueno();
}

void SubirVolumen(float Valor ) {
  Volumen = Volumen + Valor;
  Volumen = constrain(Volumen, 0, 100);
  if ( EstadoReproducion ==1) {
    Player.setVolume(map(Volumen, 0, 100, 0, 1));
  } else if ( EstadoReproducion ==2) {
    Pelicula.volume(map(Volumen, 0, 100, 0, 1));
  }
  println("Volumen Acutalizado a "+Volumen);
}