
void CargarDriver(String Direcion) {
  File Folder = new File(Direcion);
  if (Folder.isDirectory()) {
    println("Empezando a Cargar Driver");
    File[] Dispositivos = Folder.listFiles();
    for (int i = 0; i < Dispositivos.length; i++) {
      if (Dispositivos[i].isDirectory()) {
        CargarBiblioteca(Dispositivos[i].getAbsolutePath());
      }
    }
  }
}

void CargarBiblioteca(String Direcion) {
  File Folder = new File(Direcion);
  if (Folder.isDirectory()) {
    println("Empezando a Cargar Biblioteca "+Direcion);
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