/*****************
 * Next Round
 * By Bernardo Schorr, Gustavo Faria and Stephanie Burgess
 * 
 * This Code is part of the Next Round project. 
 * This is the Arduino code for the LED display.
 * 
 ******************/

//a variable to read incoming serial data from Processing
int incomingByte;

void setup() {

  //Here we initiate serial communication:
  Serial.begin(9600);

  //Here we set the digital pins to which the LEDs are connected to OUTPUT
  for (int i = 2; i <= 11; i++) {
    pinMode (i, OUTPUT);
    digitalWrite(i, LOW);
  }

}  

void loop() {

  //Any time serial is available, read it.
  if (Serial.available() > 0) {
    incomingByte = Serial.read();
  }

  //Loop through all of the LEDs
  for (int i = 13; i >= 2; i--) {
    
    //if LED number is smaller then incoming Byte, turn it on.
    if (i < incomingByte) { 
      digitalWrite (i, HIGH);
    } 
    //if LED number is bigger then incoming Byte, turn it off.
    else {
      digitalWrite(i, LOW); 
    }
  }
}







