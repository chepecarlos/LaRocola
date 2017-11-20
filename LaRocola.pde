//Variable para poner el sistema en pantalla Completa o ventana redimencionable
boolean PantallaCompleta = true;

//Vercion del sistema 
String Vercion = "0.0.3";

boolean VideoCompleto = false;
boolean VideoCompletoPasado = true;
float TiempoPasado  = 0;
//Tiempo para que termine la pista
int TiempoRestante = 0;
int TiempoPista = 0;
int ColaAnterior = 0;

float  Volumen = 70;
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

  minim = new Minim(this);
  CargarConfiguracion();
  CargarBiblioteca(RutaPista);

  Ancho =  width;
  Alto = height;
}

void draw() {

  if (BibliotecaPista.size() > 0) {
    //DibujarGenero();
  }

  if (VideoCompletoPasado != VideoCompleto) {
    println("Dibujar Fondo");
    VideoCompletoPasado = VideoCompleto;
    Fondo();
    DibujarVercion();
    DibujarGenero();
    DibujarAlbun();
    DibujarPistas();
  }

  if (BibliotecaPista.size() > 0) {
    if (!VideoCompleto) {
      if (ColaAnterior != ColaPista.size() ||  CambiarPista()) {
        ColaAnterior = ColaPista.size();
        DibujarLista();
      }
      if (PunteroActual.Genero != PunteroAnterior.Genero) {
        PunteroAnterior.Genero = PunteroActual.Genero;
        PunteroAnterior.Albun = PunteroActual.Albun;
        PunteroAnterior.Pista = PunteroActual.Pista;
        DibujarGenero();
        DibujarAlbun();
        DibujarPistas();
      } else if (PunteroActual.Albun != PunteroAnterior.Albun) {
        PunteroAnterior.Albun = PunteroActual.Albun;
        PunteroAnterior.Pista = PunteroActual.Pista;
        DibujarAlbun();
        DibujarPistas();
      } else if (PunteroActual.Pista != PunteroAnterior.Pista) {
        PunteroAnterior.Pista = PunteroActual.Pista;
        DibujarPistas();
      }
    }
  }

  if (Saldo != SaldoAnterior) {
    SaldoAnterior = Saldo;
    CantidadCreditos();
  }

  DibujarBarraReproducion();
  CambiarPista();
  //println(frameRate);
}