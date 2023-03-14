float cube_size = 3;
ArrayList<PVector> particles = new ArrayList<PVector>();

void setup() {
  size(800, 800, P3D);
}

void draw() { 
  background(#111111);
    //stroke(255);
  //strokeWeight(1);
  noStroke();
  //noFill();
  fill(#f1f1f1);
  
  float wave1 = sin(radians(frameCount))*0.5;
  
  for (int x = -int(cube_size); x <= int(cube_size); x++) {
    for (int y = -int(cube_size); y <= int(cube_size); y++) {
      for (int z = -int(cube_size); z <= int(cube_size); z++) {
        float x_pos = x + wave1;
        float y_pos = y;
        float z_pos = z;
        particles.add(new PVector(x_pos, y_pos, z_pos));
      }
    }
  }


  translate(width/2, height/2, -200);
  rotateX(radians(-30));
  rotateY(frameCount*0.01);
  //rotateZ(5);

  for (PVector p : particles) {
    pushMatrix();
    translate(p.x * 40, p.y * 40, p.z * 40);
    box(2);
    popMatrix();
  }
}
