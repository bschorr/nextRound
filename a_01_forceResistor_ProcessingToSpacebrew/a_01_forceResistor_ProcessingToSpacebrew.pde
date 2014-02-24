/*****************
 * Next Round
 * By Bernardo Schorr, Gustavo Faria and Stephanie Burgess
 * 
 * This Code is part of the Next Round project. 
 * This is the Processing code for the Sender of data from the Force Sensor.
 * 
 * Based in original code by Julio Terra and Brett Renfer
 ******************/

// Download the Spacebrew Processinglibrary and install ( https://github.com/Spacebrew/spacebrewP5 )
//communication between Processing and Spacebrew
import spacebrew.*;  

// Add this library is for serial communication between Arduino and Processing
import processing.serial.*; 

// define the spacebrew server location, app name and description
String server = "sandbox.spacebrew.cc";
String name = "nextround_coaster";
String description = "Force Senstive Resistor";

Spacebrew sb;     // Spacebrew connection object
Serial myPort;    // Serial port object 

int value = 0;    // holds temp value of the arduino data

void setup() {
  size(400, 200);

  // instantiate the spacebrew object
  sb = new Spacebrew( this );

  // add each thing you publish to
  sb.addPublish( "coaster", "range", value ); 

  // connect to spacebrew
  sb.connect(server, name, description );

  // print list of serial devices to console
  println(Serial.list());

  // CONFIRM the port that your arduino is connected to, as ports vary from computer to computer
  //Usually, it's the last port (Serial.list().length-1), but it may not be.
  myPort = new Serial(this, Serial.list()[(Serial.list().length-1)], 9600);
  myPort.bufferUntil('\n');
}

// handles serial messages from Arduino
void serialEvent (Serial myPort) {

  // read data as an ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // trim off whitespace // Get the data from Arduino and clean it up
    inString = trim(inString);

    value = int(inString); // cleaned value returned from Arduino
    println("Received data from Arduino: " + value);

    // publish the value to spacebrew if app is connected to spacebrew
    if (sb.connected()) {
      sb.send( "coaster", value );
    }
  }
}

// draws the information in the app window
void draw() {
  // set background color based on valueness
  background( value / 4, value / 4, value / 4 );

  // if background is light then make text black
  if (value < 512) { 
    fill(225, 225, 225);
  }

  // otherwise make text white
  else { 
    fill(25, 25, 25);
  }

  // set text alignment and font size
  textAlign(CENTER);
  textSize(16);

  if (sb.connected()) {
    // print client name to screen
    text("Connected as: " + name, width/2, 25 );  

    // print current value value to screen
    textSize(60);
    text(value, width/2, height/2 + 20);
  }
  else {
    text("Not Connected to Spacebrew", width/2, 25 );
  }
}

