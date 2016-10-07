const int pinR = 3;
const int pinG = 5;
const int pinB = 6;

char inData[3];
int brightnessR = 0;
int brightnessG = 0;
int brightnessB = 0;

void setup() {
  Serial.begin(9600);
  Serial.flush();
  while(!Serial);
  Serial.print(0);
}

void loop() {
  if (Serial.available() > 0) {
    Serial.readBytes(inData, 3);

    brightnessR = inData[0];
    brightnessG = inData[1];
    brightnessB = inData[2];
  }

  analogWrite(pinR, brightnessR);
  analogWrite(pinG, brightnessG);
  analogWrite(pinB, brightnessB);
}

