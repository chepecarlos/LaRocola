 //<>//
ArrayList<Genero> BibliotecaPista = new ArrayList<Genero>();
//ArrayList<Albun> Biblioteca = new ArrayList<Albun>();
ArrayList<Pista> ColaPista = new ArrayList<Pista>();

//GeneroActual>>AlbunActual>>PistaActual
Genero GeneroActual;
Albun AlbunActual;
Pista PistaActual;

//Objeto para manejar video
Movie Pelicula;

//Objeto para repducicir 
AudioPlayer Player;

Puntero PunteroActual = new Puntero();
Puntero PunteroMenu = new Puntero();

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

  void add(Pista PistaActual) {
    CantidadPistas++;
    ListaPista.add(PistaActual);
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
        case "mkv":
        case "MKV":
          EsPista = true;
          break;
        default:
          EsPista= false;
          break;
        }
        if (EsPista) {
          print("--");
          println("Pista-" + Pista.getName());
          ListaPista.add(new Pista(Pista.getName(), Pista.getAbsolutePath()));
          CantidadPistas++;
        }
      }
    }
  }
}

void CargarBiblioteca(String Direcion) {
  File Folder = new File(Direcion);
  if (Folder.isDirectory()) {
    println("Empezando a Cargar Biblioteca");
    File[] FolderGenero  = Folder.listFiles();
    for (int i = 0; i < FolderGenero.length; i++) {
      if (FolderGenero[i].isDirectory()) {
        println("Genero-"+i+" "+FolderGenero[i].getName());
        Genero GeneroTMP = new Genero(FolderGenero[i].getName(), Direcion+"/"+FolderGenero[i].getName());
        File[] FolderArtista = FolderGenero[i].listFiles();
        for (int j = 0; j< FolderArtista.length; j++) {
          if (FolderArtista[j].isDirectory()) {
            println("-Artista="+j+" "+FolderArtista[j].getName());
            Albun ArtistaTMP = new Albun(FolderArtista[j].getName(), Direcion+"/"+FolderGenero[i].getName()+"/"+FolderArtista[j].getName());
            GeneroTMP.add(ArtistaTMP);
          }
        }
        BibliotecaPista.add(GeneroTMP);
      }
    }
    GeneroActual = BibliotecaPista.get(0);
    AlbunActual = GeneroActual.get(0);
    PistaActual = AlbunActual.get(0);
  } else {
    println("Error encontrando Biblioteca");
  }
}