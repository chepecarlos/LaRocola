void RepducirVideo() {
  EstadoReproducion = 2;
  Pelicula = new Movie(this, NombreCanciones[IDCancion]);
  Pelicula.volume(map(Volumen, 0, 100, 0, 1));
  Pelicula.play();
}