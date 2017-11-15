//Variable para poner el sistema en pantalla Completa o ventana redimencionable
boolean PantallaCompleta = false;

//Vercion del sistema 
String Vercion = "0.0.3";

boolean VideoCompleto = false;
float TiempoPasado  = 0;
//Tiempo para que termine la pista
int TiempoRestante = 0;
int TiempoPista = 0;
int ColaAnterior = 0;

//Direcion de la musica
String RutaCanciones;

float  Volumen = 50;
//Tamaño de la pantalla
float Ancho;
float Alto;
//Cuanto fondos hay 
float Saldo = 0;
float SaldoAnterior = -1;

int EstadoReproducion = 0;

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

  Ancho =  width;
  Alto = height;
}

void draw() {
  if (PunteroActual.Diferente(PunteroAnterior) || 
    Saldo != SaldoAnterior ||
    CambiarPista() ||
    ColaAnterior != ColaPista.size() ) {
    SaldoAnterior = Saldo;
    PunteroAnterior.Asignar(PunteroActual);
    ColaAnterior = ColaPista.size();
    Fondo();
    if (BibliotecaPista.size() > 0) {
      println("Dibujar GUI");
      if (!VideoCompleto) {
        DibujarAlbunes();
        DibujarPistas();
        DibujarLista();
        DibujarVercion();
        CantidadCreditos();
        DibujarGenero();
      }
    }
  }
  DibujarBarraReproducion();

  CambiarPista();
  //println(frameRate);
}