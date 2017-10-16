class Pista {
  PImage ImagenPista;
  String NombrePista;
  String DirecionPista;
  boolean EsAudio;

  Pista(String Nombre, String Direcion) {
    DirecionPista = Direcion;
    NombrePista = Nombre;
    TipoPista();
  }

  void TipoPista() {
    String[] Tipo = split(NombrePista, ".");
    println("Tipo : " + Tipo[Tipo.length-1]);
    switch(Tipo[Tipo.length-1]) {
    case "mp4":
      EsAudio = false;
      break;
    default:
      EsAudio = true;
      break;
    }
  }
}

class Albun {
  int CantidadPistas;
  String NombreAlbun;
  String DirecionAlbun;

  ArrayList<Pista> ListaPista = new ArrayList<Pista>();

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

void CargarAlbun(String Directorio) {
  File Archivos = new File(Directorio);
  if (Archivos.isDirectory()) {
    println("\nListing info about all files in a directory and all subdirectories: ");
    ArrayList<File> ListaDirectorios = listFilesRecursive(Directorio);
    for (File D : ListaDirectorios) {
      if (D.isDirectory()) {
        Biblioteca.add(new Albun(D.getName(), D.getAbsolutePath()));
        print("Folder: " + D.getName());
        println(" | " + D.getAbsolutePath());
      }
    }
    //return names;
  } else {
    //No es directorio
    //return null;
  }
  println("Cantidad de Albunes "+ Biblioteca.size());
}