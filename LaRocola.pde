//Libreria de Audio de processing
import processing.sound.*;
import java.util.Date;


SoundFile ArchivoMusica;
String RutaCanciones;
String[] NombreCanciones; 

void setup() {
  size(600, 400);

  RutaCanciones = sketchPath()+"/data";

  println("Lista de Canciones");
  NombreCanciones = ListaNombreArchivo(RutaCanciones);
  printArray(NombreCanciones);
  println(NombreCanciones.length);
  
  ArchivoMusica = new SoundFile(this, NombreCanciones[0]);
  ArchivoMusica.loop();
  
}

void draw() {
}