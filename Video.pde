//Liberias de Video de processing
import processing.video.*;

//Objeto para manejar video
Movie Pelicula;

void ReproducirVideo(String Direcion) {
  EstadoReproducion = 2;
  Pelicula = new Movie(this, Direcion);
  //Pelicula.volume(map(Volumen, 0, 100, 0, 1));
  Pelicula.play();
}

void MostarVideoMiniatura() {
  pushMatrix();
  Pelicula.read();
  float AnchoV = Ancho*0.28;
  float AltoV =  (AnchoV*Pelicula.pixelHeight)/Pelicula.pixelWidth;
  image(Pelicula, Ancho*0.72, Alto*0.15, AnchoV, AltoV);
  popMatrix();
}

void MostarVideoCompleto() {
  Pelicula.read();
  float AnchoV = Ancho;
  float AltoV =  (AnchoV*Pelicula.pixelHeight)/Pelicula.pixelWidth;
  image(Pelicula, 0, 0,AnchoV, AltoV);
}