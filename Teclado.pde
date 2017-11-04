import java.io.*;

/*
 * Control Teclado
 * q o Q -> Subir saldo 0.25
 * e o E -> Subir Saldo 1.00
 * w o W-> Reproducir Pista
 * UP o a -> Subir Lista
 * DONW o z -> Bajar Lista
 * RIGHT o s -> Subir Albun
 * LEFT o X -> Bajar Albun
 * PgUp o f -> Subir Genero
 * PGDn o V -> Bajar Genero 
 * o -> Actualizar Git
 * p -> Apagar PC
 */

void keyReleased() {
  VideoCompleto = false;
  TiempoPasado = millis();
  //println("key: "+key);
  //println("keyCode: "+keyCode); 
  if (key == 'q' || key == 'Q') {
    ActualizarSaldo(0.25);
  } else if (key == 'e' || key == 'E') {
    ActualizarSaldo(1);
  } else if (Saldo > 0) {
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
    case 11://Page Up
      println("Bajar Genero");
      BajarGenero();
      break;
    case 16://Page Donw
      println( "Subir Genero");
      SubirGenero();
      break;
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
      println("Subir Genero");
      SubirGenero();
      break;
    case 'v':
    case 'V':
      println("Bajar Genero");
      BajarGenero();
      break;
    case 'w'://Reproducir Pista
    case 'W':
      println("Iniciar Reproducion");
      ReproducirPista();
      break;
    }
  }
}

void SubirPista() {
  PunteroActual.Pista++;
  if (PunteroActual.Pista> AlbunActual.CantidadPistas -1) {
    PunteroActual.Pista--;
  }
  PistaActual = AlbunActual.get( PunteroActual.Pista);
  println("Pista Actual "+PunteroActual.Pista+":"+PistaActual.NombrePista);
}

void BajarPista() {
  PunteroActual.Pista--;
  if (PunteroActual.Pista < 0) {
    PunteroActual.Pista ++;
  }
  PistaActual = AlbunActual.get( PunteroActual.Pista);
  println("Pista Actual "+PunteroActual.Pista+":"+PistaActual.NombrePista);
}

void SubirAlbun() {
  PunteroActual.Albun++; 
  if (PunteroActual.Albun > GeneroActual.CantidadAlbunes - 1) {
    PunteroActual.Albun--;
  } else {
    AlbunActual = GeneroActual.get(PunteroActual.Albun);
  }
  PunteroActual.Pista = 0;
  PunteroMenu.Pista = 0;
  println("Menu Albun "+PunteroActual.Albun+":"+AlbunActual.NombreAlbun);
}

void BajarAlbun() {
  PunteroActual.Albun--; 
  if (PunteroActual.Albun < 0) {
    PunteroActual.Albun++;
  } else {
    AlbunActual = GeneroActual.get(PunteroActual.Albun);
  }
  PunteroActual.Pista = 0;
  PunteroMenu.Pista = 0;
  println("Menu Albun "+PunteroActual.Albun+":"+AlbunActual.NombreAlbun);
}

void ActualizarSaldo(float C) {
  Saldo = Saldo + C;
  println("Saldo Actual "+Saldo);
}

void ReproducirPista() {
  Saldo = Saldo - 0.25;
  GeneroActual = BibliotecaPista.get(PunteroActual.Genero);
  AlbunActual = GeneroActual.get(PunteroActual.Albun);
  PistaActual = AlbunActual.get(PunteroActual.Pista);
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

void BajarGenero() {
  println("Bajando Genero");
  
}

void SubirGenero() {
  println("Alto Genero");
}