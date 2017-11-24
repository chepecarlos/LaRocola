Genero GeneroActual; //<>//
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