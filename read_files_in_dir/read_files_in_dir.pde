import java.io.File;
import processing.serial.*;

Serial myPort;  // Create object from Serial class 
File folder;
String [] filenames;
 
void setup(){
  folder = new java.io.File("C:\\Users\\LG G500\\Videos\\series");
  size(200,200); //make our canvas 200 x 200 pixels big
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  noLoop();
} //<>//
 
void draw()
{
  filenames = folder.list();
  //println(filenames.length + ".properties.ser");
 
  for(int i = 0; i < filenames.length; i++)
  {
    println(filenames[i]);
    myPort.write(filenames[i]+"\n");
    myPort.write("****************\n");
    delay(1000);
    if(i == filenames.length - 1){
      break;
    }
  } 
}