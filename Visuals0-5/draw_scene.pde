void drawScene(){
  strokeWeight(1);
  switch(scene){
    case 0:
      background(bg); // Fondo negro
      break;
    case 1:
      drawText(); // Dibuja texto
      break;
    case 2:
      drawShapesplus(); // Dibuja primitivos 3D y loops de fondo
      break;
    case 3:
      drawPttrn(); //Dibuja patrones animados
      break;
  }
  /*
  switch(linedraw%3){
    case 0:
   lns=false;
   break;
   
   case 1:
   lns=false;
   break;
   
   case 2:
   lns=true;
   break;
   
   default:
   lns=false;
}
    if (!lns){
  }else{
  stroke(fg);
  strokeWeight(3);
  for (int lean = 0; lean < quant; lean++) {
    line(random(width), random(height), random(width), random(height));
  }
  */
 
}
