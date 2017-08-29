//Libreria de Audio de processing
import processing.sound.*;
import java.util.Date;

SoundFile ArchivoMusica;
String RutaCanciones;
String[] NombreCanciones; 
int IDCancion = 5;
float  Volumen = 50; 
float Ancho;
float Alto;
float Saldo = 0;
void setup() {
  size(600, 400);
  Ancho =  width;
  Alto = height;

  RutaCanciones = sketchPath()+"/data";

  println("Lista de Canciones");
  NombreCanciones = ListaNombreArchivo(RutaCanciones);
  printArray(NombreCanciones);
  println(NombreCanciones.length);

  // ArchivoMusica = new SoundFile(this, NombreCanciones[0]);
  // ArchivoMusica.loop();
  //ArchivoMusica.amp(map(Volumen, 0, 100, 0, 1));
}

void draw() {
  Fondo();
  Nombre();
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      IDCancion = IDCancion + 1;
    } else if (keyCode == DOWN) {
      IDCancion = IDCancion - 1;
    }
    if (IDCancion<0) {
      IDCancion = NombreCanciones.length - 1;
    } else if (IDCancion >= NombreCanciones.length) {
      IDCancion = 0;
    }
    println("El ID Cansion es "+IDCancion);
  } else if (key == 'a') {
    Saldo = Saldo + 1;
    println("Saldo Actual "+Saldo);
  } else if (key == 'w') {
    Volumen = Volumen + 5;
  } else if (key == 's') {
    Volumen = Volumen - 5;
  }  
  Volumen = constrain(Volumen, 0, 100);
  //ArchivoMusica.amp(map(Volumen, 0, 100, 0, 1));
  println("Volumen Acutalizado a "+Volumen);
}