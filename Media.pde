void  ReproducirMedia() {
  println("Repoducir:"+NombreCanciones[IDCancion]);
  String[] Tipo = split(NombreCanciones[IDCancion], ".");
  println("Tipo : " + Tipo[Tipo.length-1]);
  switch(Tipo[Tipo.length-1]) {
  case "mp4":
    RepducirVideo();
    break;
  default:
    RepducirAudio();
    break;
  }
}

void CambiarMedia() {
  if (EstadoReproducion == 1) {
    if ( Player.position() == Player.length() ) {
      if (SiquienteMedia()) {
        println("Repoduciendo Despues de musica");
        ReproducirMedia();
      }
    }
  } else if (EstadoReproducion == 2) {
    if (Pelicula.duration() == Pelicula.time()) {
      if (SiquienteMedia()) {
        println("Repoduciendo Despues de Video");
        ReproducirMedia();
      }
    }
  }
}

boolean SiquienteMedia() {
  if ( CancionesDespues.size() >0) {
    IDCancion = (int)CancionesDespues.get(0);
    CancionesDespues.remove(0);
    return true;
  }
  EstadoReproducion = 0;
  return false;
}