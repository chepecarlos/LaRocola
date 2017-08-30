//Libreria de Audio de processing
import processing.sound.*;
import java.util.Date;

//Objeto para repdocucir musica
SoundFile ArchivoMusica;
//Direcion de la musica
String RutaCanciones;
//Nombre de las cansiones del folder
String[] NombreCanciones;
//ID de la cansion actual
int IDCancion = 0;
//Valumen 0 - 100
float  Volumen = 50;
//Tamaño de la pantalla
float Ancho;
float Alto;
//Cuanto fondos hay 
float Saldo = 0;

void setup() {
  size(1200, 600);
  //fullScreen();
  Ancho =  width;
  Alto = height;

  RutaCanciones = sketchPath()+"/data";

  println("Lista de Canciones");
  NombreCanciones = ListaNombreArchivo(RutaCanciones);
  printArray(NombreCanciones);
  println("Cantidad de cansiones"+ NombreCanciones.length);

  // ArchivoMusica = new SoundFile(this, NombreCanciones[0]);
  // ArchivoMusica.loop();
  //ArchivoMusica.amp(map(Volumen, 0, 100, 0, 1));
}

void draw() {
  Fondo();
  Nombre();
  CantidadCreditos();
}

void keyReleased() {
  if (key == 'a') {
    Saldo = Saldo + 1;
    println("Saldo Actual "+Saldo);
  } else if (Saldo > 0) {
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
    } else if (key == 'w') {
      SubirVolumen(-5);
    } else if (key == 's') {
      SubirVolumen(5);
    }
  }
}

void SubirVolumen(float Valor ) {
  Volumen = Volumen + Valor;
  Volumen = constrain(Volumen, 0, 100);
  //ArchivoMusica.amp(map(Volumen, 0, 100, 0, 1));
  println("Volumen Acutalizado a "+Volumen);
}