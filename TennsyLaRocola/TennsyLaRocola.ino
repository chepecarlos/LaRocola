#define PinMoneda 14//A0 en Arduino  

int CantidadBotones = 6;
int Botones[7] = {0, 1, 2, 3, 4, 5};
char Letras[7] = {'e', 'd', 'w', 's', 'q', 'o'};

void setup() {

  Serial.begin(115200);
  pinMode(PinMoneda, INPUT); // sets the digital pin as output
  attachInterrupt(PinMoneda, Token, FALLING); // interrrupt 1 is data ready
  for (int i = 0; i <= CantidadBotones; i++) {
    pinMode(Botones[i], INPUT);
  }
}

void loop() {
  for (int i = 0; i <= CantidadBotones; i++) {
    if (digitalRead(Botones[i]) == 0) {
      Keyboard.print(Letras[i]);
      delay(500);
      Serial.println(Letras[i]);
    }
  }
}

void Token() {
  cli();
  Keyboard.press('a');
  delay(10);
  Keyboard.release('a');
  Serial.println("Token");
  sei();
}
