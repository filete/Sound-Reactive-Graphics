void drawShapesplus(){
  
//-------------------------------------------
  String numberString = bpm;
  float BPM = int(numberString);  
  speed=map(BPM,83.133,166.266,1,2);
//-------------------------------------------
float wave = tan(radians(frameCount))*100;

  background(bg);
  stroke(fg);
  pushMatrix();
  translate(width/2,height/2,0+wave);
  noFill(); 
  
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
     rotateX(radians(90));
     rotateZ(-tan(radians(frameCount)));
     beginShape();
       vertex(-200, -200, -200);
       vertex( 200, -200, -200);
       vertex(   0,    0,  200);

       vertex( 200, -200, -200);
       vertex( 200,  200, -200);
       vertex(   0,    0,  200);

       vertex( 200, 200, -200);
       vertex(-200, 200, -200);
       vertex(   0,   0,  200);

       vertex(-200,  200, -200);
       vertex(-200, -200, -200);
       vertex(   0,    0,  200);
endShape();
     break;
  }
  popMatrix();
  
  float els = 100;
  float elw = width/els;
  push();
  translate(width/2, elw/2);
  float mag = width*0.4;
  float s = 30;
  
switch(crfill%2){
    case 0:
    break;
    
    case 1:
    fill(fg);
    noStroke();
    break;
}
  
switch(bgtype%3){
    case 0:
  for (int i = 0; i < els; i++) {
    push();  
    float wave2;
    wave2 = map(tan(radians(frameCount*4 + i*5)*speed), -1, 1, -mag/2, mag/2);
    translate(wave2, i*elw);
    ellipse(0, 0, s, s);
    pop();
  }
  break;
  
    case 1:
     float magnitude = height*0.3;
  for (int i = 0; i < els; i++) {
    float wave3 = map(sin(radians(frameCount*4 + i*5)*speed), -1, 1, -magnitude, magnitude);
    push();
    translate(wave3, i*elw);
    ellipse(0, 0, s, s);
    pop();
  }
  break;
   
  case 2:
  for (int i = 0; i < els; i++) {
    float wave4 = map(tan(radians(frameCount*4 + i*10)*speed), -1, 1, -mag/2, mag/2);
    push();
    translate(i*elw, wave4);
    ellipse(0, 0, s, s);
    pop();
  }
  break;
}
  pop();
 
 }
 
 
