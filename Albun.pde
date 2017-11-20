ArrayList<Genero> BibliotecaPista = new ArrayList<Genero>(); //<>//
ArrayList<Pista> ColaPista = new ArrayList<Pista>();

Genero GeneroActual;
Albun AlbunActual;
Pista PistaActual;

Puntero PunteroActual = new Puntero();
Puntero PunteroAnterior = new Puntero(-1);
Puntero PunteroMenu = new Puntero();

class Albun {
  int CantidadPistas;
  String NombreAlbun;
  String DirecionAlbun;
  String DirecionImagen;

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
        if (Pista.getName().equals(NombrePortada)) {
          println("---Caratula-"+Pista.getAbsolutePath());
          this.DirecionImagen = Pista.getAbsolutePath();
        } else {
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
            EsPista = false;
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
    if (this.DirecionImagen == null) {
      this.DirecionImagen = NombrePortada;
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
            if (ArtistaTMP.CantidadPistas > 0) {
              GeneroTMP.add(ArtistaTMP);
            } else {
              println("Elininar Artista "+ArtistaTMP.NombreAlbun);
            }
          } else if (FolderArtista[j].getName().equals(NombrePortada)) {
            println("--Caratula-"+FolderArtista[j].getAbsolutePath());      
            GeneroTMP.DirecionImagen = FolderArtista[j].getAbsolutePath();
          } else {
            println("Algo mas "+FolderArtista[j].getName());
          }
        }
        if (GeneroTMP.DirecionImagen == null) {
          GeneroTMP.DirecionImagen = NombrePortada;
        }
        BibliotecaPista.add(GeneroTMP);
      }
    }
    for (int i = BibliotecaPista.size()-1; i > 0; i--) {
      if (BibliotecaPista.get(i).CantidadArtista == 0) {
        println("Eliminar Genero "+BibliotecaPista.get(i).NombreGenero);
        BibliotecaPista.remove(i);
      }
    };

    GeneroActual = BibliotecaPista.get(0);
    AlbunActual = GeneroActual.get(0);
    PistaActual = AlbunActual.get(0);
  } else {
    println("Error encontrando Biblioteca");
  }
}