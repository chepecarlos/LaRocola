#include <Bounce.h>
#define PinInterupcion 14 //A0

Bounce button0 = Bounce(0, 10);
Bounce button1 = Bounce(1, 10);
Bounce button2 = Bounce(2, 10);
Bounce button3 = Bounce(3, 10);
Bounce button4 = Bounce(4, 10);

void setup() {

  Serial.begin(9600);

  pinMode(0, INPUT_PULLUP);
  pinMode(1, INPUT_PULLUP);
  pinMode(2, INPUT_PULLUP);
  pinMode(3, INPUT_PULLUP);
  pinMode(4, INPUT_PULLUP);

  pinMode(PinInterupcion, INPUT);

  attachInterrupt(PinInterupcion, IngresarMoneda, FALLING);
}

void loop() {
  button0.update();
  button1.update();
  button2.update();
  button3.update();
  button4.update();

  if (button0.fallingEdge()) {
    Keyboard.press('w');
    Keyboard.release('w');
  }
  if (button1.fallingEdge()) {
    Keyboard.press('s');
    Keyboard.release('s');
  }
  if (button2.fallingEdge()) {
    Keyboard.press('e');
    Keyboard.release('e');
  }
  if (button3.fallingEdge()) {
    Keyboard.press('d');
    Keyboard.release('d');
  }
  if (button4.fallingEdge()) {
    Keyboard.press('q');
    Keyboard.release('q');
  }
}

void IngresarMoneda() {
  cli();
  Keyboard.press('a');
  Keyboard.release('a');
  sei();
}
