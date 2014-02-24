/*****************
 * Next Round
 * By Bernardo Schorr, Gustavo Faria and Stephanie Burgess
 * 
 * This Code is part of the Next Round project. 
 * This is the Arduino code for the Force Sensor, under the coaster.
 * 
 ******************/

// this is how much the glass weighs
//we'll use this to know if the glass is on the coaster or not.
int glassWeight = 50;

void setup() {
  
  // open serial port
  Serial.begin(9600);
  
}

void loop() {
  
  // read the value of the Force Sensor
  long raw_val = analogRead(A0);

  //is their a cup is over the coaster?
  if(raw_val > glassWeight) {
    
    // yes, the cup is over the coaster so send data.
    Serial.println(raw_val);
    
  } 
  // else, don't do anything. 
  // We don't need to know everytime you take a sip, 
  // we need to know if the bottle is empty.

  //Leave a delay for sending data.
  delay(100);
}

