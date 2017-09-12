
void keyReleased() {
  switch(key) {
  case 'a':
    Saldo = Saldo + 1;
    println("Saldo Actual "+Saldo);
    break;
  case 'e':
    IDCancion = IDCancion + 1;
    if (IDCancion >= NombreCanciones.length) {
      IDCancion = 0;
    }
    break;
  case 'd':
    IDCancion = IDCancion - 1;
    if (IDCancion<0) {
      IDCancion = NombreCanciones.length - 1;
    }
    break;
  case 'o':
    exec("shutdown now");
    break;
  case 'p':
    println("Salir de la App");
    break;
  case 'w':
    SubirVolumen(-5);
    break;
  case 's':
    SubirVolumen(5);
    break;
  case 'q':
    if (Reproduciendo  == 0) {
      println("Repoducir:"+NombreCanciones[IDCancion]);
      String[] Tipo = split(NombreCanciones[IDCancion], ".");
      Saldo = Saldo-1;
      println("Tipo : " + Tipo[Tipo.length-1]);
      switch(Tipo[Tipo.length-1]) {
      case "mp3":
      case "MP3":
        RepducirAudio();
        Saldo = Saldo-1;
        break;
      case "mp4":
        RepducirVideo();
        break;
      }
    } else {
      println("Agregando para despues");
      int Valor = IDCancion;
      CancionesDespues.add(Valor);
    }
    break;
  }
}