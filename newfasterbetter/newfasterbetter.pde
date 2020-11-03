int boxheight = 150;
int wallpos = 50;
int boxsize = 50;
int x0 = 300;
int y0 = 500;
int N = 2;
int counter = 0;
PVector mass = new PVector(1,(int)Math.pow(100,N));
PVector vel = new PVector(0,-0.1);
PVector velstorage = new PVector();
PVector pos = new PVector(x0,y0);
int framecount = 0;

BufferedReader reader;
String line;
void setup(){
  size(600,300);
  frameRate(1000);
  //String link = "/Users/kayacelebi/Desktop/pisim/simfor"+N+".txt";
  String link ="../pisim/simfor"+N+".txt";
  reader = createReader(link);
}

void draw(){
  try{
    line = reader.readLine();
  }
  catch(IOException e){
    line = null;
  }
  if(line == null)
  {
    noLoop();
  }
  else{
    background(0);
    stroke(255);
    line(0,200,600,200); // floor
    fill(255);
    String[] parsed = split(line,' '); //redefine to position at i-1
    if(parsed[0].equals("Collision")) 
    {
      counter++;
    }
    else{
      rect(Float.parseFloat(parsed[0]),boxheight,boxsize,boxsize); // box x
      rect(Float.parseFloat(parsed[1]),boxheight,boxsize,boxsize); // box y
    }
    textSize(50);
    text(counter,300,250);
  }
}
