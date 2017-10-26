//Variable para poner el sistema en pantalla Completa o ventana redimencionable
boolean PantallaCompleta = true;

//Vercion del sistema 
String Vercion = "0.0.1";

//Objeto para Manejar Minin
Minim minim; 

boolean VideoCompleto = false;
float TiempoPasado  = 0;
//Tiempo para que termine la pista
int TiempoRestante = 0;

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
float Saldo = 0;

int EstadoReproducion = 0;
PFont FuentaSimple;

PFont FuenteIndice;
PFont FuenteAlbun;


void setup() {
  if (!PantallaCompleta ) {
    surface.setResizable(true);
  }
  //frameRate(60);

  FuenteIndice =  createFont("Anton.ttf", 100);
  FuenteAlbun  = createFont("Ubuntu-L.ttf", 100);

  //  CancionesDespues = new ArrayList();
  RutaCanciones = sketchPath()+"/data";

  minim = new Minim(this);

  // println("Lista de Canciones");
  //NombreCanciones = ListaNombreArchivo(RutaCanciones);
  //printArray(NombreCanciones);
  //println("Cantidad de cansiones: "+ NombreCanciones.length);
  CargarAlbun("/home/chepecarlos/Musica");
}

void draw() {
  Fondo();
  if (Biblioteca.size() > 0) {
    if (!VideoCompleto) {
      DibujarAlbunes();
      DibujarPistas();
      DibujarLista();
      DibujarVercion();
      CantidadCreditos();
    }
    CambiarPista();
  }
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