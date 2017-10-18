//Libreria de Audio de processing
import ddf.minim.*;
import ddf.minim.effects.*;
//Liberias de Video de processing
import processing.video.*;

//Objeto para manejar video
Movie Pelicula;

//Objeto para repducicir 
AudioPlayer Player;

int[] PistaActual = {0, 0};

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

  void BuscarPista() {
    File[] ListaArchivos = listFiles(DirecionAlbun);
    for (int i = 0; i<ListaArchivos.length; i++) {
      print(">>");
      File Pista = ListaArchivos[i]; 
      if (!Pista.isDirectory()) {
        print("Cancion: " + Pista.getName());
        println(" | " + Pista.getAbsolutePath());
        ListaPista.add(new Pista(Pista.getName(), Pista.getAbsolutePath()));
        CantidadPistas++;
      }
    }
  }
}

ArrayList<Albun> Biblioteca = new ArrayList<Albun>();
ArrayList<Pista> ColaPista = new ArrayList<Pista>();

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
    println("Cantidad de Albunes "+ Biblioteca.size());
  } else {
    println("No existe directorio/Intenta de nuevo");
  }
}