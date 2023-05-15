import themidibus.*;
import ddf.minim.*;
import oscP5.*;
import netP5.*;

//--------------------------------------------
Minim minim;
AudioInput in;
MidiBus myBus;
//*****************************||
OscP5 oscP5;                 
NetAddress myRemoteLocation; 
//*****************************||

//--------------------------------------------
int scene=0;
int shape=0;
int cantidad=0;
int bgtype=0;
int crfill=0;
int frame=0;
int quant=2;
int linedraw=2;
int cScheme=0;
int texto=0;
boolean lns=false;
PFont font;
PGraphics pg;
//--------------------------------------------
float tam = 0;
float margin = 200;
float f = 0.5;
float frequence =  10/10;
float x,y;
float speed = 0;

//*****************************||
String bpm = str(0);
float BPM = 0;
float oscMessage = 0;
//*****************************||
//--------------------------------------------
color bg=#111111;
color fg=#f1f1f1;
//--------------------------------------------
String t1 = "Lorem";
String t2 = "Ipsum";
String t3 = "Dolor";
String t4 = "Sit";
String t5 = "Amet.";
String t6 = "天翔る8号S";

//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
void setup() {
  font = createFont("FOT-MatissePro-EB_0.otf", 600);
  size(1200,900,P3D);
  //fullScreen(P3D, 1);
  pg = createGraphics(1300, 900, P2D);
  noFill();
  rectMode(CENTER);
  
  MidiBus.list();
  myBus = new MidiBus(this, "visuals", -1);
  minim = new Minim(this);
  in = minim.getLineIn();
//*****************************||
  oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
//*****************************||
}

//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
void draw() {
String numberString = bpm;
float BPM = int(numberString);
  //println(bpm);
  //margin =map(BPM,75,175,200,50);
  smooth();
  scheme();
  drawScene();

}

//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
void noteOn(int channel, int pitch, int velocity) {
  if((channel==0)&&(pitch==24)){
    crfill++;
    frame++;
  }else if((channel==0)&&(pitch==26)){  // Figura 3d
    shape++;
    cantidad++;
    texto++;
  }else if((channel==0)&&(pitch==25)){  // Loop de fondo
    bgtype++;
  }else if((channel==0)&&(pitch==0)){   // +Escena
    scene++;
  }else if((channel==0)&&(pitch==1)){   // -Escena
    scene--;
  }else if((channel==0)&&(pitch==constrain(pitch,40,100))){   // -Random lines
    linedraw++;
  }else if((channel==0)&&(pitch==2)){   //Esquema de color 1 Negro y blanco
    cScheme=0;
  }else if((channel==0)&&(pitch==3)){   //Esquema de color 2 Blaco y negro
    cScheme=1;
  }else if((channel==0)&&(pitch==4)){   //Esquema de color 3 Marrón y beige
    cScheme=2;
  }else if((channel==0)&&(pitch==5)){   //Esquema de color 4 Beige y marrón
    cScheme=3;
  }else if((channel==0)&&(pitch==6)){   //Esquema de color 5 Verde y verde claro
    cScheme=4;
  }else if((channel==0)&&(pitch==7)){   //Esquema de color 6 Verde claro y verde
    cScheme=5;
  }else if((channel==0)&&(pitch==8)){   //Esquema de color 6 Morado y crema
    cScheme=6;
  }else if((channel==0)&&(pitch==9)){   //Esquema de color 6 Crema y morado
    cScheme=7;
  }else if(scene>=4){
    scene=scene-2;
  }  
}

//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
void noteOff() { // NoteOff function only runs when a Note Off message is recieved
  // trigger any events on note off
}

//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
 void oscEvent(OscMessage theOscMessage) {
 bpm = theOscMessage.addrPattern();
}

void keyPressed() {
  saveFrame("final-######.png");
}
