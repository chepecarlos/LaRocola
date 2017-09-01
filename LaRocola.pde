//Libreria de Audio de processing
import processing.sound.*;
import java.util.Date;

//Objeto para repdocucir musica
SoundFile ArchivoMusica;
//
AudioDevice device;

//Objeto que tiene la Amplitud
Amplitude AmplitudMusica;
//Direcion de la musica
String RutaCanciones;
FFT fft;
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

  // If the Buffersize is larger than the FFT Size, the FFT will fail
  // so we set Buffersize equal to bands
  device = new AudioDevice(this, 44000, bands);
  // Calculate the width of the rects depending on how many bands we have
  r_width = width/float(bands);


  println("Lista de Canciones");
  NombreCanciones = ListaNombreArchivo(RutaCanciones);
  printArray(NombreCanciones);
  println("Cantidad de cansiones"+ NombreCanciones.length);
}

void draw() {
  Fondo();
  Nombre();
  CantidadCreditos();
  DibujarVolumen();
}

void keyReleased() {
  if (key == 'a') {
    Saldo = Saldo + 1;
    println("Saldo Actual "+Saldo);
  } else if (Saldo > 0) {
    if (key == 'e' || key == 'd') {
      if (key == 'e') {
        IDCancion = IDCancion + 1;
      } else if (key == 'd') {
        IDCancion = IDCancion - 1;
      }
      if (IDCancion<0) {
        IDCancion = NombreCanciones.length - 1;
      } else if (IDCancion >= NombreCanciones.length) {
        IDCancion = 0;
      }
    } else if (key == 'w') {
      SubirVolumen(-5);
    } else if (key == 's') {
      SubirVolumen(5);
    } else if (key == 'q') {
      if ( !Reproduciendo) {
        Saldo = Saldo-1;
        ArchivoMusica = new SoundFile(this, NombreCanciones[IDCancion]);
        ArchivoMusica.play();
        ArchivoMusica.amp(map(Volumen, 0, 100, 0, 1));
        fft = new FFT(this, bands);
        fft.input(ArchivoMusica);
        //AmplitudMusica = new Amplitude(this);
        //AmplitudMusica.input(ArchivoMusica);
      } else {
        ArchivoMusica.stop();
      }
      Reproduciendo = !Reproduciendo;
    }
  }
}

void SubirVolumen(float Valor ) {
  Volumen = Volumen + Valor;
  Volumen = constrain(Volumen, 0, 100);
  //ArchivoMusica.amp(map(Volumen, 0, 100, 0, 1));
  println("Volumen Acutalizado a "+Volumen);
}