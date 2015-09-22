/*==========================================================
Project: Read data from Text file into Processing
Author: ScottC
Created: 23rd Jun 2011 (Updated 26th Aug 2014)
Description: Use processing to read a text file and populate an ArrayList.
             The ArrayList is then printed to the debug window.
             
Processing version tested: 2.2.1
References: This was made possible using bits and pieces from these sites
         http://www.kodejava.org/examples/28.html
         http://processing.org/reference/ArrayList.html
         http://processing.org/reference/splitTokens_.html
         
===========================================================  */
import java.io.FileReader;
import java.io.FileNotFoundException;
import processing.serial.*;


ArrayList sensorData;
ArrayList columnOne;
Serial comPort;
int counter=0; // Helps to keep track of values sent.
int numItems=0; //Keep track of the number of values in text file
boolean sendStrings=false; //Turns sending on and off
StringLoader sLoader; //Used to send values to Arduino

void setup(){
  comPort = new Serial(this, "/dev/ttyACM0", 9600);
  sensorData=new ArrayList();
  columnOne=new ArrayList();
  background(255,0,0); //Start with a Red background
}

void draw(){
}
void mousePressed() {
 //Toggle between sending values and not sending values
 sendStrings=!sendStrings;
 
 //If sendStrings is True - then send values to Arduino
 if(sendStrings){
 background(0,255,0); //Change the background to green
 
 /*When the background is green, transmit
 text file values to the Arduino */
 sLoader=new StringLoader();
 sLoader.start();
 }else{
 background(255,0,0); //Change background to red
 //Reset the counter
 counter=0;
 }
}

 public class StringLoader extends Thread{
 
 public StringLoader(){
 //default constructor
 }
 
 public void run() {
 String textFileLines[]=loadStrings("/home/nigel/Documents/test_read.txt");
 String lineItems[]=splitTokens(textFileLines[0], ",");
 numItems=lineItems.length;
 for(int i = counter; i<numItems; i++){
 print(lineItems[i] + ".....");
 comPort.write(lineItems[i]);
 delay(500);
 comPort.write("0");
 }
 counter=numItems;
 }
}