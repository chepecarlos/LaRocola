//Clase de la pista que mantiene la informacion base sobre ellas y metos de repdocuion
class Pista {
  String NombrePista;
  String DirecionPista;
  String DirecionImagen;
  boolean EsAudio;
  boolean Reproduciendo;

  Pista(String Nombre, String Direcion) {
    DirecionPista = Direcion;
    NombrePista = Nombre;
    Reproduciendo = false;
    TipoPista();
    CargarImagen();
  }

  void CargarImagen() {
    //ImagenPista = loadImage("Albun.jpg");
  }

  void TipoPista() {
    String[] Tipo = split(NombrePista, ".");
    switch(Tipo[Tipo.length-1]) {
    case "mp4":
      EsAudio = false;
      break;
    default:
      EsAudio = true;
      break;
    }
  }

  void Reproducir() {
    if (EsAudio) {
      println("Reproducir Audio");
      ReproducirAudio(DirecionPista);
    } else {
      println("Reproducir Video");
      ReproducirVideo(DirecionPista);
    }
    Reproduciendo = true;
  }

  boolean Termino() {
    if (EsAudio) {
      TiempoRestante = ( Player.length() -Player.position() )/1000;
      if ( abs(Player.position() -Player.length() ) < 100) {
        return true;
      }
    } else {
      if (VideoCompleto) {
        MostarVideoCompleto();
        println(frameRate);
      } else {
        MostarVideoMiniatura();
        Sueno();
      }
      TiempoRestante =int(Pelicula.duration() - Pelicula.time());
      if (TiempoRestante == 0) {
        VideoCompleto = false;
        return true;
      }
    }
    return false;
  }

  float TiempoFalta() {
    if (EsAudio) {
      return Player.length()-Player.position();
    } else {
      return Pelicula.time()-Pelicula.duration();
    }
  }
}