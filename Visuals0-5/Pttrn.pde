void drawPttrn(){
  background(bg);
  stroke(fg);
  noFill();
  
  String numberString = bpm;
  float BPM = int(numberString);  
  frequence=map(BPM,75,140,0.3,3);
  
int quant = 10;  
switch(cantidad%3){
    case 0:
    quant = 10;  
    break;
    
    case 1:
    quant = 20;  
    break;
    
    case 2:
    quant = 30;
    break;
}

float tam = (width-2*margin)/quant;

switch(crfill%2){
    case 0:
    break;
    
    case 1:
    fill(fg);
    noStroke();
    break;
}
  
switch(bgtype%4){
    case 0:
    for (int g = 0;g < quant; g++){
    
      for (int i = 0; i<quant; i++){
        x = margin + tam/2+i*tam;
        y = margin/4 + tam/2+g*tam;
        f = sin( frequence * radians(frameCount) + x-y);
       ellipse(x, y,f * tam,f * tam);
  }
  }
  break;
  
    case 1:
for (int g = 0;g < quant; g++){
    
      for (int i = 0; i<quant; i++){
        x = margin + tam/2+i*tam;
        y = margin/4 + tam/2+g*tam;
        f = sin( frequence * radians(frameCount) + y*x);
       ellipse(x, y,f * tam,f * tam);
  }
  }
  break;
   
  case 2:
for (int g = 0;g < quant; g++){
    
      for (int i = 0; i<quant; i++){
        x = margin + tam/2+i*tam;
        y = margin/4 + tam/2+g*tam;
        f = sin( frequence * radians(frameCount) + 0.2*dist(width/2,height/2,x,y));
       ellipse(x, y,f * tam,f * tam);
  }
  }
  break;
  case 3:
for (int g = 0;g < quant; g++){
    
      for (int i = 0; i<quant; i++){
        x = margin + tam/2+i*tam;
        y = margin/4 + tam/2+g*tam;
        f = sin( frequence * radians(frameCount) + x/y);
       ellipse(x, y,f * tam,f * tam);
  }
  }
  break; 
}
}
