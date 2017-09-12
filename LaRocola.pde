//Libreria de Audio de processing
import ddf.minim.*;
import ddf.minim.effects.*;
//Liberias de Video de processing
import processing.video.*;

//Objeto para Manejar Minin
Minim minim; 

//Objeto para manejar video
Movie Pelicula;

//Objeto para repducicir 
AudioPlayer Player;

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

int Reproduciendo = 0;

void setup() {
  //size(1200, 600);
  fullScreen();
  Ancho =  width;
  Alto = height;

  RutaCanciones = sketchPath()+"/data";

  minim = new Minim(this);

  println("Lista de Canciones");
  NombreCanciones = ListaNombreArchivo(RutaCanciones);
  printArray(NombreCanciones);
  println("Cantidad de cansiones: "+ NombreCanciones.length);
}

void draw() {
  Fondo();
  ActualizarVideo();
  Nombre();
  CantidadCreditos();
  DibujarVolumen();
}

void SubirVolumen(float Valor ) {
  Volumen = Volumen + Valor;
  Volumen = constrain(Volumen, 0, 100);
  if ( Reproduciendo ==1) {
    Player.setVolume(map(Volumen, 0, 100, 0, 1));
  } else if ( Reproduciendo ==2) {
    Pelicula.volume(map(Volumen, 0, 100, 0, 1));
  }
  println("Volumen Acutalizado a "+Volumen);
}

void RepducirVideo() {
  Reproduciendo = 2;
  Pelicula = new Movie(this, NombreCanciones[IDCancion]);
  Pelicula.volume(map(Volumen, 0, 100, 0, 1));
  Pelicula.play();
}

void RepducirAudio() {
  Reproduciendo = 1;
  Player = minim.loadFile(NombreCanciones[IDCancion]);
  Player.setVolume(map(Volumen, 0, 100, 0, 1));
  Player.play();
}