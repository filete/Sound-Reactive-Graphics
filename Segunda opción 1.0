import themidibus.*; //Import the MIDI Bus library for MIDI communication
import ddf.minim.*; // Iport the Minim Library for sound input

Minim minim; // Create instances of Minim
AudioInput in;
MidiBus myBus; // and MidiBus

int scene=0; // Keep track of the current scene
int shape=0; // and shape

color bg=17;
color fg=241;

float soundWeight; // Store the sound volume weight

void setup() {
  size(900,900,P3D);
  colorMode(HSB);
  noFill();
  rectMode(CENTER);
  smooth(8);
  
  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.

  // or for testing you could ...
  //                 Parent  In        Out
  //                   |     |          |
  myBus = new MidiBus(this, "visuals", -1); // Create a new MidiBus class with no input device and the "visuals" port as the output device.

  minim = new Minim(this); // Create a new Minim class for sound input
  in = minim.getLineIn();  // Enable 
}

void draw() {
  soundWeight=in.mix.level()*5; // Read the audio input and scale the value
  drawScene(); // Draw the visuals
}

void noteOn(int channel, int pitch, int velocity) { // NoteOn function only runs when a Note On message is recieved
  //Receive a noteOn and trigger events
  
  //println();  // uncomment to see all the incoming messages
  //println("Note On:");
  //println("--------");
  //println("Channel:"+channel);
  //println("Pitch:"+pitch);
  //println("Velocity:"+velocity);
  
  if((channel==0)&&(pitch==60)){ // Kick note will change colors
    randomColors();
  }else if((channel==0)&&(pitch==62)){ // Snare note will sellect the next shape
    shape++;
 // }else if((channel==0)&&(pitch==64)){ // Snare note will sellect the next shape
  //  detail++;
  }else if((channel==0)&&(pitch==0)){ // Move to the next scene
    scene++;
  }else if((channel==0)&&(pitch==1)){ // Move to the previouc scene
    scene--;
  }
}

void noteOff(int channel, int pitch, int velocity) { // NoteOff function only runs when a Note Off message is recieved
  // trigger any events on note off
} 

void drawScene(){ // A function we use to draw different things according to the current scene
  switch(scene){ // We only have 4 scenes here
    case 0:
      background(bg); // set the background black
      break;
    case 1:
      background(bg); // just draw the background with its color
      break;
    case 2:
      drawShapes(0); //draw static shapes over the background
      break;
    case 3:
      drawShapes(soundWeight); //draw shapes that scale to the incoming volume levels. We pass the sound weight as the size value
      break;
  }
}

void randomColors(){ // A function we use to change randomly the colors
    bg=color(0,0,random(7,27)); // Set a random color for the background with a hue from 127 to 255
    fg=color(random(360),100,100);; // Set a random color for the outlines with a hue from 0 to 126
}



void drawShapes(float size){
  float wave = tan(radians(frameCount))*100;
  background(bg); // First draw the background
  stroke(fg); // Set the outline color
  pushMatrix();
  translate(width/2,height/2,0+wave); // Start drawing from the center of the screen
    
  switch(shape%3){
    case 0:
      rotateX(radians(frameCount));
      box(height/2);
      break;

    case 1:
      rotateY(-radians(frameCount));
      sphere(height/3.2);
      break;
      
    case 2:
     rotateX(radians(frameCount));
     box(height/2);
     rotateX(-radians(frameCount));
     rotateY(-radians(frameCount)*2);
     sphere(height/3.2);
     break;
  }
  popMatrix();
  }
