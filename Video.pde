void ReproducirVideo(String Direcion) {
  EstadoReproducion = 2;
  Pelicula = new Movie(this, Direcion);
  //Pelicula.volume(map(Volumen, 0, 100, 0, 1));
  Pelicula.play();
}

void MostarVideoMiniatura() {
  pushMatrix();
  Pelicula.read();
  image(Pelicula, Ancho/4, Alto/4, Ancho/3, Alto/4);
  popMatrix();
}

void MostarVideoCompleto() {
  Pelicula.read();
  image(Pelicula, 0, 0, width, height);
}