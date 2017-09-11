//Libreria de Audio de processing
import ddf.minim.*;
import ddf.minim.effects.*;

//Objeto para Manejar Minin
Minim minim; 

//Objeto para repducicir 
AudioPlayer Player;

//Direcion de la musica
String RutaCanciones;
//Nombre de las cansiones del folder
String[] NombreCanciones;
ArrayList Canciones;
ArrayList Video;
//ID de la cansion actual
int IDCancion = 0;
//Valumen 0 - 100
float  Volumen = 50;
//Tamaño de la pantalla
float Ancho;
float Alto;
//Cuanto fondos hay 
float Saldo = 0;
//Graficos Fondo
int bands = 64;
float[] sum = new float[bands];
int scale=5;
float smooth_factor = 0.5;
float r_width;



boolean Reproduciendo = false;

void setup() {
  //size(1200, 600);
  fullScreen();
  Ancho =  width;
  Alto = height;

  RutaCanciones = sketchPath()+"/data";


  minim = new Minim(this);
  // Calculate the width of the rects depending on how many bands we have
  r_width = width/float(bands);


  println("Lista de Canciones");
  NombreCanciones = ListaNombreArchivo(RutaCanciones);
  printArray(NombreCanciones);
  println("Cantidad de cansiones: "+ NombreCanciones.length);
}

void draw() {
  Fondo();
  Nombre();
  CantidadCreditos();
  DibujarVolumen();
}

void SubirVolumen(float Valor ) {
  Volumen = Volumen + Valor;
  Volumen = constrain(Volumen, 0, 100);
  //ArchivoMusica.amp(map(Volumen, 0, 100, 0, 1));
  println("Volumen Acutalizado a "+Volumen);
}