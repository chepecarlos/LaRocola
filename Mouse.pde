import java.io.*;

/*
 * Control Teclado
 * q o Q -> Subir Saldo
 * w o W-> Reproducir Pista
 * UP o a -> Subir Lista
 * DONW o z -> Bajar Lista
 * RIGHT o s -> Subir Albun
 * LEFT o X -> Bajar Albun
 * o -> Actualizar Git
 * p -> Apagar PC
 * f -> Subir Volumen
 * v -> Bajar Volumen 
 */

void keyReleased() {
  Dormir = false;
  TiempoPasado = millis();
  if (key == 'q' || key == 'Q') {
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
      case RIGHT:
        println("Subir Albun");
        SubirAlbun();
        break;
      case LEFT:
        println("Bajar Albun");
        BajarAlbun();
        break;
      }
    }
    switch(key) {
    case 'a':
    case 'A':
      println("Subir Pista");
      SubirPista();
      break;
    case 'z':
    case 'Z':
      println("Bajar Pista");
      BajarPista();
      break;
    case 's':
    case 'S':
      println("Subir Albun");
      SubirAlbun();
      break;
    case 'x':
    case 'X':
      println("Bajar Albun");
      BajarAlbun();
      break;
    case 'o'://Ejecutar Actualizacion
    case 'O':
      println("Actualizar GIT");
      EjecutarActualizacion();
      ApagarPC();
      break;
    case 'p'://Apagar la PC
    case 'P':
      println("Apagar la PC");
      ApagarPC();
      break;
    case 'f':
    case 'F':
      SubirVolumen(5);
      break;
    case 'v':
    case 'V':
      SubirVolumen(-5);
      break;
    case 'w'://Reproducir Pista
    case 'W':
      ReproducirPista();
      break;
    }
  }
}

void SubirPista() {
  PunteroActual[1]++;
  if (PunteroActual[1]> AlbunActual.CantidadPistas -1) {
    PunteroActual[1]--;
  }
  PistaActual = AlbunActual.get( PunteroActual[1]);
  println("Pista Actual "+PunteroActual[1]+":"+PistaActual.NombrePista);
}

void BajarPista() {
  PunteroActual[1]--;
  if (PunteroActual[1] < 0) {
    PunteroActual[1] ++;
  }
  PistaActual = AlbunActual.get( PunteroActual[1]);
  println("Pista Actual "+PunteroActual[1]+":"+PistaActual.NombrePista);
}

void SubirAlbun() {
  PunteroActual[0]++; 
  if (PunteroActual[0] > Biblioteca.size() - 1) {
    PunteroActual[0]--;
  } else {
    AlbunActual = Biblioteca.get(PunteroActual[0]);
  }
  PunteroActual[1] = 0;
  IndiceAlbun[1] = 0;
  println("Menu Albun "+PunteroActual[0]+":"+AlbunActual.NombreAlbun);
}

void BajarAlbun() {
  PunteroActual[0]--; 
  if (PunteroActual[0] < 0) {
    PunteroActual[0]++;
  } else {
    AlbunActual = Biblioteca.get(PunteroActual[0]);
  }
  PunteroActual[1] = 0;
  IndiceAlbun[1] = 0;
  println("Menu Albun "+PunteroActual[0]+":"+AlbunActual.NombreAlbun);
}

void ActualizarSaldo() {
  Saldo = Saldo + 1;
  println("Saldo Actual "+Saldo);
}

void ReproducirPista() {
  //Saldo = Saldo -1;
  AlbunActual = Biblioteca.get(PunteroActual[0]);
  PistaActual = AlbunActual.get(PunteroActual[1]);
  ColaPista.add(PistaActual);
  println("Agregar la lista "+ColaPista.size()+":"+PistaActual.NombrePista);
}

void ApagarPC() {
  println("Apagar PC");
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