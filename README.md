Next Round / Spacebrew Tutorial
=====================

**In this tutorial, we’ll build a system to connect a beer coaster with an LED display and speaker to warn the waiter that the next round of drinks should be brought.**

![alt tag](https://raw.github.com/bschorr/nextRound/screenshots/screenshots/mainImage.jpg)

The idea of this project is that bars and/or restaurants would be able to keep track of their customer's drinking behavior. If the customer's glass is about to get empty, waiters can fill them up or suggest another drink. The product is based on a coaster with a Force Sensitive Resistor (FSR) under it, that sends data to a display of LEDs and speakers that receive the data and make noise to alert the waiters. It also avoids waiters coming over to see if “everything is alright”. Check out our video [here](http://vimeo.com/87528084)

####Software you'll need

- [Processing](http://www.processing.org)
- [Arduino](http://www.arduino.cc)
- [SpacebrewP5 library](https://github.com/Spacebrew/spacebrewP5)
- [SFEMP3Shield Library](https://github.com/madsci1016/Sparkfun-MP3-Player-Shield-Arduino-Library)

Install SpacebrewP5 copying the folder inside spacebrewP5/dist/spacebrew to your Processing library folder. If you never went through this process before, you can take a look in this [video tutorial](http://www.youtube.com/watch?v=SRRQoQ2I3A8) by Kyle Macmillain.


####Hardware you'll need
- 3 [Arduino UNOs](https://www.sparkfun.com/products/11021)
- 3 USB cables
- Some building materials (cardboard, foamboard, balsa wood)
- A pressure sensor, similar to [this one]( http://www.adafruit.com/products/1075)
- A glass / cardboard coaster
- 9 LEDs of different colors
- An MP3 player shield like [this one](https://www.sparkfun.com/products/10628)
- A speaker with a P2 connection of your choice
- A micro SD Card and reader
- 3 mp3 files
- Wires, solder and a breadboard

####Downloading the code

Download the zipped file with all the code [here](https://github.com/bschorr/nextRound/archive/master.zip).

In the ZIP file, you'll find 6 thoroughly commented sketches (3 processing and 3 arduino):

- a_01_forceResistor_Arduino
- a_01_forceResistor_ProcessingToSpacebrew
- b_02_LED_Display_Arduino
- b_02_LED_Display_Processing
- c_03_soundAlert_Arduino
- c_03_soundAlert_Processing

####Building the circuits

The images below show the schematics for each of the 3 circuits, with pictures of our own implementations of each of them. Get creative and build your own!
#####Pressure sensor
![alt tag](https://raw.github.com/bschorr/nextRound/screenshots/screenshots/pressureSensor.png)

#####LED Display
![alt tag](https://raw.github.com/bschorr/nextRound/screenshots/screenshots/ledDisplay.jpg)

#####Speaker
![alt tag](https://raw.github.com/bschorr/nextRound/screenshots/screenshots/speaker.png)

####Finishing touches
Once your hardware is ready, upload the corresponding arduino code to each of your 3 arduinos connected to the corresponding circuits. 

**Note that because communication is done via Serial, you have to run each instance of this project on a different computer. It will NOT work if running from the same machine.**

Once your arduinos are wired and with code uploaded, you can plug them to the 3 different computers. You should now run the corresponding Processing sketch in each of these computers. Once you do so, your Spacebrew instances will appear in the [Spacebrew Sandbox website](http://spacebrew.github.io/spacebrew/admin/admin.html?server=sandbox.spacebrew.cc).

Once you are in the Spacebrew Sandbox page, you can connect the 3 instances as following:
![alt tag](https://raw.github.com/bschorr/nextRound/screenshots/screenshots/spacebrew.png)

###And you're ready to go!





