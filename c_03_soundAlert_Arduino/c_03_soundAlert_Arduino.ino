/*****************
 * Next Round
 * By Bernardo Schorr, Gustavo Faria and Stephanie Burgess
 * 
 * This Code is part of the Next Round project. 
 * This is the Arduino code for the sound alerts.
 * 
 ******************/

//include the libraries needed for the MP3 shield
#include <SPI.h>
//This library allows you to communicate with SPI devices, with the Arduino as the master device.
//Add the SdFat Libraries
#include <SdFat.h>
#include <SdFatUtil.h>
//and the MP3 Shield Library
#include <SFEMP3Shield.h>
//The Arduino SdFat Library is a minimal implementation of FAT16 and FAT32 file systems on SD flash memory cards.
//upload these libraries to allow SD card to be read.
int incomingByte;  //a variable to read incoming serial data
int recordedRange; //a variable to record the last range received
int prevByte;

/**
 * \brief Object instancing the SdFat library.
 *
 * principal object for handling all SdCard functions.
 */
SdFat sd;

/**
 * \brief Object instancing the SFEMP3Shield library.
 *
 * principal object for handling all the attributes, members and functions for the library.
 */
SFEMP3Shield MP3player;

void setup() {
  //initiate serial communication:
  Serial.begin(9600);

  //Initialize the SdCard.
  if(!sd.begin(SD_SEL, SPI_HALF_SPEED)) sd.initErrorHalt();
  if(!sd.chdir("/")) sd.errorHalt("sd.chdir");

  //Initialize the MP3 Player Shield
  MP3player.begin();


}

void loop(){

  //read serial messages
  if (Serial.available() > 0) {
    //read the incomingByte in the serial monitor
    incomingByte = Serial.read();
  }
  //make sure MP3player is available
  MP3player.available();
  //read the serial port
  while (Serial.available()) incomingByte = Serial.read();
  //tell the sound only to play when there is a new reading
  if (incomingByte != prevByte) {
    if (incomingByte == 1) {
      MP3player.stopTrack();
      MP3player.playTrack(3);
      //set a 3 second delay after the track is played
      delay(3000);
    }

    else if (incomingByte == 2) {
      MP3player.stopTrack();
      MP3player.playTrack(2);
      //set a 3 second delay after the track is played
      delay(3000);
    }

    else if (incomingByte == 3) {
      MP3player.stopTrack();
      MP3player.playTrack(1);
      //set a 3 second delay after the track is played
      delay(3000);
    }
    prevByte = incomingByte;
  }
}







