//Variable para poner el sistema en pantalla Completa o ventana redimencionable
boolean PantallaCompleta = false;

//Vercion del sistema 
String Vercion = "0.0.2";

boolean VideoCompleto = false;
float TiempoPasado  = 0;
//Tiempo para que termine la pista
int TiempoRestante = 0;

//Direcion de la musica
String RutaCanciones;

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
  noCursor();
  //frameRate(60);

  FuenteIndice =  createFont("Anton.ttf", 100);
  FuenteAlbun  = createFont("Ubuntu-L.ttf", 100);

  RutaCanciones = sketchPath()+"/data";

  minim = new Minim(this);

  //CargarAlbun("/home/chepecarlos/Musica");

  CargarBiblioteca("/home/chepecarlos/Musica");
}

void draw() {
  Fondo();
  if (BibliotecaPista.size() > 0) {
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