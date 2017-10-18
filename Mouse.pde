import java.io.*;

void keyReleased() {
  Dormir = false;
  TiempoPasado = millis();
  if (key == 'a') {
    ActualizarSaldo();
  } else if (Saldo > 0) {
    if (key == CODED) {
      switch(keyCode) {
      case UP:
        println("Subir Pista");
        SubirPista();
        break;
      case DOWN:
        println("Bajar Pista");
        BajarPista();
        break;
      case LEFT:
        println("Subir Albun");
        SubirAlbun();
        break;
      case RIGHT:
        println("Bajar Albun");
        BajarAlbun();
        break;
      }
    }
    switch(key) {
    case 'a':
      println("Subir Pista");
      SubirPista();
      break;
    case 'z':
      println("Bajar Pista");
      BajarPista();
      break;
    case 's':
      println("Subir Albun");
      SubirAlbun();
      break;
    case 'x':
      println("Bajar Albun");
      BajarAlbun();
      break;
    case 'o'://Ejecutar Actualizacion
      println("Actualizar GIT");
      EjecutarActualizacion();
      break;
    case 'p'://Apagar la PC
      println("Apagar la PC");
      ApagarPC();
      break;
    case 'w':
      SubirVolumen(-5);
      break;
    case 'f':
      SubirVolumen(5);
      break;
    case 'v'://Reproducir Pista
      ReproducirPista();
      break;
    }
  }
}

void SubirPista() {
}

void BajarPista() {
}

void SubirAlbun() {
}

void BajarAlbun() {
}

void ActualizarSaldo() {
  Saldo = Saldo + 1;
  println("Saldo Actual "+Saldo);
}

void ReproducirPista() {
  if ( ColaPista.size() > 0) {
    Saldo = Saldo - 1;
    Pista PistaActual = ColaPista.get(0);
    PistaActual.Reproducir();
  }
  if (EstadoReproducion  == 0) {
    println("Repoduciondo desde Apagado");
    ReproducirMedia();
  } else {
    println("Agregando para despues:");
    int Valor = IDCancion;
    CancionesDespues.add(Valor);
    printArray(CancionesDespues);
  }
}

void ApagarPC() {
  exec("shutdown", "now");
}

void EjecutarActualizacion() {
  //exec("shutdown","now");
  // Process p = exec("pwd");
  launch("python", "/home/chepecarlos/sketchbook/LaRocola/Actualizar.py");
  //Process p = exec("git", "pull", "/home/chepecarlos/sketchbook/LaRocola/");
  Process p = exec("python", "/home/chepecarlos/sketchbook/LaRocola/Actualizar.py");

  println("Comado de actualicacion");
  try {
    int result = p.waitFor();
    String line;
    BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
    while ( (line = input.readLine ()) != null) {
      println("the process returned " + line);
    }
    input.close();
  }
  catch (Exception err) {
    println("error comando");
  }
}