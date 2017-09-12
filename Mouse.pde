
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
   Saldo = Saldo-1;
    if (EstadoReproducion  == 0) {
     println("Repoduciondo desde Apagado");
     ReproducirMedia();
    } else {
      println("Agregando para despues:");
      int Valor = IDCancion;
      CancionesDespues.add(Valor);
      printArray(CancionesDespues);
    }
    break;
  }
}