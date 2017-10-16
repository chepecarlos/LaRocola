class Pista {
  PImage ImagenPista;
  String NombrePista;
  String DirecionPista;

  Pista(String Nombre, String Direcion) {
    DirecionPista = Direcion;
    NombrePista = Nombre;
  }
}

class Albun {
  String NombreAlbun;
  String DirecionAlbun;
  ArrayList<Pista> ListaPista = new ArrayList<Pista>();

  Albun(String Nombre, String Direcion) {
    NombreAlbun = Nombre;
    DirecionAlbun = Direcion;
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
        print("Nombre: " + D.getName());
        println(" Archivo: " + D.getAbsolutePath());
      }
    }
    //return names;
  } else {
    //No es directorio
    //return null;
  }
}