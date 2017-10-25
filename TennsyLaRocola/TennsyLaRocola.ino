#include <Bounce.h>
#define PinCorra 14 //A0
#define PinDolar 15 //A1


// Q - Saldo 0.25
// E - Saldo 1.00
Bounce Reproducir = Bounce(0, 10);    // w - Reproducir
Bounce SubirLista = Bounce(1, 10);    // a - Subir Lista
Bounce BajarLista = Bounce(2, 10);    // z - Bajar Lista
Bounce SubirAlbun = Bounce(3, 10);    // s - Subir Albun
Bounce BajarAlbun = Bounce(4, 10);    // x - Bajar Albun
Bounce ActualizarGit = Bounce(5, 10); // o - Actualizar
Bounce ApagarPC = Bounce(6, 10);      // p - Apagar PC
Bounce SubirVolumen = Bounce(7, 10);  // f - Subir Volumen
Bounce BajarVolumen = Bounce(8, 10);  // v - Bajar Volume

void setup() {

  Serial.begin(9600);

  for (int i = 0; i < 9; i++) {
    pinMode(i, INPUT_PULLUP);
  }

  pinMode(PinCorra, INPUT);
  attachInterrupt(PinCorra, IngresarCorra, FALLING);

  
  pinMode(PinDolar, INPUT);
  attachInterrupt(PinDolar, IngresarDolar, FALLING);

}

void loop() {
  Reproducir.update();
  SubirLista.update();
  BajarLista.update();
  SubirAlbun.update();
  BajarAlbun.update();
  ActualizarGit.update();
  ApagarPC.update();
  SubirVolumen.update();
  BajarVolumen.update();

  PrecionarTecla( Reproducir, 'w');
  PrecionarTecla( SubirLista, 'a');
  PrecionarTecla( BajarLista, 'z');
  PrecionarTecla( SubirAlbun, 's');
  PrecionarTecla( BajarAlbun, 'x');
  PrecionarTecla( ActualizarGit, 'o');
  PrecionarTecla( ApagarPC, 'p');
  PrecionarTecla( SubirVolumen, 'f');
  PrecionarTecla( BajarVolumen, 'v');

}

void PrecionarTecla(Bounce Boton, char Letra) {
  if (Boton.fallingEdge()) {
    Keyboard.press(Letra);
    Keyboard.release(Letra);
  }
}

void IngresarDolar() {
  cli();
  Keyboard.press('e');
  Keyboard.release('e');
  sei();
}

void IngresarCorra() {
  cli();
  Keyboard.press('q');
  Keyboard.release('q');
  sei();
}
