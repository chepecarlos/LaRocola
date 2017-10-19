//Libreria de Audio de processing //<>// //<>//
import ddf.minim.*;
import ddf.minim.effects.*;
//Liberias de Video de processing
import processing.video.*;

ArrayList<Albun> Biblioteca = new ArrayList<Albun>();
ArrayList<Pista> ColaPista = new ArrayList<Pista>();

Albun AlbunActual;
Pista PistaActual;

//Objeto para manejar video
Movie Pelicula;

//Objeto para repducicir 
AudioPlayer Player;

int[] PunteroActual = {0, 0};

class Pista {
  PImage ImagenPista;
  String NombrePista;
  String DirecionPista;
  boolean EsAudio;
  boolean Reproduciendo;

  Pista(String Nombre, String Direcion) {
    DirecionPista = Direcion;
    NombrePista = Nombre;
    Reproduciendo = false;
    TipoPista();
    CargarImagen();
  }

  void CargarImagen() {
    //ImagenPista = loadImage("Albun.jpg");
  }

  void TipoPista() {
    String[] Tipo = split(NombrePista, ".");
    switch(Tipo[Tipo.length-1]) {
    case "mp4":
      EsAudio = false;
      break;
    default:
      EsAudio = true;
      break;
    }
  }

  void Reproducir() {
    if (EsAudio) {
      println("Reproducir Audio");
      ReproducirAudio();
    } else {
      println("Reproducir Video");
      ReproducirVideo(DirecionPista);
    }
  }
}

class Albun {
  int CantidadPistas;
  String NombreAlbun;
  String DirecionAlbun;

  ArrayList<Pista> ListaPista = new ArrayList<Pista>();

  //Contructor del albun 
  Albun(String Nombre, String Direcion) {
    NombreAlbun = Nombre;
    DirecionAlbun = Direcion;
    CantidadPistas = 0;
    BuscarPista();
  }

  Pista get(int i) {
    return ListaPista.get(i);
  }

  void BuscarPista() {
    File[] ListaArchivos = listFiles(DirecionAlbun);
    for (int i = 0; i<ListaArchivos.length; i++) {
      boolean EsPista = false;
      File Pista = ListaArchivos[i]; 
      if (!Pista.isDirectory()) {
        String[] Tipo = split(Pista.getName(), ".");
        switch(Tipo[Tipo.length-1]) {
        case "mp4":
        case "MP4":
        case "mp3":
        case "MP3":
        case "wav":
        case "WAV":
        case "au":
        case "AU":
          EsPista = true;
          break;
        default:
          EsPista= false;
          break;
        }
        if (EsPista) {
          print(">>");
          print("Cancion: " + Pista.getName());
          println(" | " + Pista.getAbsolutePath());
          ListaPista.add(new Pista(Pista.getName(), Pista.getAbsolutePath()));
          CantidadPistas++;
        }
      }
    }
  }
}


void CargarAlbun(String Directorio) {
  File Archivos = new File(Directorio);
  if (Archivos.isDirectory()) {
    println("\nEmpezando a buscar Pistas dentro de Albunes");
    ArrayList<File> ListaDirectorios = listFilesRecursive(Directorio);
    for (File D : ListaDirectorios) {
      if (D.isDirectory()) {
        Biblioteca.add(new Albun(D.getName(), D.getAbsolutePath()));
        print("Folder: " + D.getName());
        println(" | " + D.getAbsolutePath());
      }
    }
    //Eliminando todo Albun sin canciones
    for (int i = Biblioteca.size() -1; i > -1; i--) {
      Albun  AlbunPrueva  = Biblioteca.get(i);
      if (AlbunPrueva.CantidadPistas == 0) {
        Biblioteca.remove(i);
      }
    }
    AlbunActual = Biblioteca.get(0);
    PistaActual = AlbunActual.get(0);
    println("Dencidad Actual "+displayDensity());
    println("Cantidad de Albunes "+ Biblioteca.size());
    println("Cantidad de Pistas "+ AlbunActual.CantidadPistas);
  } else {
    println("No existe directorio/Intenta de nuevo");
  }
}