import java.io.*;

void keyReleased() {
  Dormir = false;
  TiempoPasado = millis();
  if (key == 'a') {
    Saldo = Saldo + 1;
    println("Saldo Actual "+Saldo);
  } else if (Saldo > 0) {
    switch(key) {
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
      //exec("shutdown","now");
      // Process p = exec("pwd");
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
}