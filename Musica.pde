//Libreria de Audio de processing
import ddf.minim.*;
import ddf.minim.effects.*;

//Objeto para repducicir 
AudioPlayer Player;

//Objeto para Manejar Minin
Minim minim; 

void ReproducirAudio(String Direcion) {
  EstadoReproducion = 1;
  Player = minim.loadFile(Direcion);
  Player.setVolume(map(Volumen, 0, 100, 0, 1));
  Player.play();
}