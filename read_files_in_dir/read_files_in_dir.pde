import java.io.File;
 
File folder;
String [] filenames;
 
void setup(){
  folder = new java.io.File("/home/nigel/Documents");
}
 
void draw()
{
  filenames = folder.list();
  println(filenames.length + ".properties.ser");
 
  for(int i = 0; i < filenames.length; i++)
  {
    println(filenames[i]);
    
    if(i == filenames.length - 1){
      break;
    }
  }
  
}