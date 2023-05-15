void drawText(){
  int n=12;
  int m=18;
  background(bg);
  pg.beginDraw();
  pg.background(bg);
  pg.fill(fg);
  pg.noStroke();
  pg.textFont(font);
  pg.textSize(300);
  pg.pushMatrix();
  pg.translate(width/2, height/2);
  pg.textAlign(CENTER, CENTER);

  switch(texto%8){
  case 0:
  pg.text(t1, 0, 0);
  break;
  
  case 1:
  pg.text(t2, 0, 0);
  break;
  
  case 2:
  pg.text(t3, 0, 0);
  break;
  
  case 3:
  pg.text(t4, 0, 0);
  break;
  
  case 4:
  pg.text(t5, 0, 0);
  break;
  
  case 5:
  pg.text("黒", 0, 0);
  break;
  
  case 6:
  pg.text("フィェテ", 0, 0);
  break;
  
  case 7:
  pg.text(t6, 0, 0);
  break;
  }
  
  pg.popMatrix();
  pg.endDraw();

  int tilesX = m;
  int tilesY = n;

  int tileW = int(width/tilesX);
  int tileH = int(height/tilesY);

  for (int y = 0; y < tilesY; y++) {
    for (int x = 0; x < tilesX; x++) {

     int wave = int(sin(frameCount * 0.06 + ( x + y ) * 0.2) * 100); 
     int wave2 = int(tan(frameCount * 0.02 + ( x + y ) * (0.001*wave)) * 80); 

      int sx = x*tileW + wave;
      int sy = y*tileH;
      int sw = tileW;
      int sh = tileH;

      int dx = x*tileW;
      int dy = y*tileH;
      int dw = tileW;
      int dh = tileH;
      
      copy(pg, sx, sy, sw, sh, dx, dy, dw, dh);

    }
  }
}
