/*****************
 * Next Round
 * By Bernardo Schorr, Gustavo Faria and Stephanie Burgess
 * 
 * This Code is part of the Next Round project. 
 * This is the Processing code for the receiver in the LED Display.
 * 
 * Based in original code by Julio Terra and Brett Renfer
 ******************/

//importing the spacebrew and serial libraries
import spacebrew.*;
import processing.serial.*;

//setting up server, name and description for spacebrew connection
String server="sandbox.spacebrew.cc";
String name="BerGusSteph_ProcessingToArduino";
String description ="Range to LEDs";

//values in the arduino are 2 to 11 in this case. 
//This variable holds the mapped value from 0-1023 range from Spacebrew to the 2-11 range.
int sendValueToArduino = 2;

Spacebrew sb; //our spacebrew object
Serial myPort; //the serial port

void setup() {

  //This doesn't matter. Processing is not drawing anything. 
  //See description at the top.
  size(50, 50);

  sb = new Spacebrew( this );

  // adding the range and the on/off button
  sb.addSubscribe( "remote_LEDs", "range" );

  // connect!
  sb.connect("ws://"+server+":9000", name, description );

  //print available serial ports to console
  int i = 0;
  for (String s : Serial.list()) {
    println(Integer.toString(i) + ": " + s);
    i++;
  }
  
  //You may need to change the serial port that Processing
  //connects to. Look at the output in the Processing console
  //to determine which index your Arduino is at.
  //You can check that by going to your Arduino software and checking 
  //Tools > Serial Port
  myPort = new Serial(this, Serial.list()[(Serial.list().length-1)], 9600); 
  myPort.bufferUntil('\n');
}

void draw() {
  
//Nothing done here!
//see description at the top.
}

//This checks the range messages
void onRangeMessage( String name, int value ) {
  
  //map values from 0-1023 to 2-11
  sendValueToArduino = int (map (value, 620, 820, 2, 11));
  
  //print mapped values to console and send them to Arduino via serial.
  println ("got range message " + name + " : " + sendValueToArduino);
  myPort.write(sendValueToArduino); 
}
