
void keyReleased() {
  if (key == 'a') {
    Saldo = Saldo + 1;
    println("Saldo Actual "+Saldo);
  } else if (Saldo > 0) {
    if (key == 'e' || key == 'd') {
      if (key == 'e') {
        IDCancion = IDCancion + 1;
      } else if (key == 'd') {
        IDCancion = IDCancion - 1;
      }
      if (IDCancion<0) {
        IDCancion = NombreCanciones.length - 1;
      } else if (IDCancion >= NombreCanciones.length) {
        IDCancion = 0;
      }
    } else if (key == 'o') {
      exec("shutdown now");
    } else if (key == 'p') {
      println("Salir de la App");
    } else if (key == 'w') {
      SubirVolumen(-5);
    } else if (key == 's') {
      SubirVolumen(5);
    } else if (key == 'q') {
      println("Repoducir:"+NombreCanciones[IDCancion]);
      Player = minim.loadFile(NombreCanciones[IDCancion]);
      Player.setVolume(map(Volumen, 0, 100, 0, 1));
      Player.play();
      Saldo = Saldo-1;
    }
  }
}