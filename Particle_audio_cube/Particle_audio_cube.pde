import ddf.minim.*;
import ddf.minim.analysis.*;

float cube_size = 3;
ArrayList<PVector> particles = new ArrayList<PVector>();

Minim minim;
AudioPlayer audioPlayer;
FFT fft;

void setup() {
  size(1000, 1000, P3D);
  minim = new Minim(this);
  audioPlayer = minim.loadFile("uni.mp3");
  fft = new FFT(audioPlayer.bufferSize(), audioPlayer.sampleRate());
  // Representa el cubo
  for (int x = -int(cube_size); x <= int(cube_size); x++) {
    for (int y = -int(cube_size); y <= int(cube_size); y++) {
      for (int z = -int(cube_size); z <= int(cube_size); z++) {
        float x_pos = x;
        float y_pos = y;
        float z_pos = z;
        particles.add(new PVector(x_pos, y_pos, z_pos));
      }
    }
  }
}

void draw() { 
    if (mousePressed) {
    audioPlayer.play();}
  background(#111111);
  noStroke();
  
  fft.forward(audioPlayer.mix); // Análisis del audio con FFT
  
  // Mapeado de las frecuencias a valores float 0-1
  float bassAmplitude = fft.getBand(0) / 100.0;
  float midAmplitude = fft.getBand(fft.specSize()/2) / 100.0;
  float highAmplitude = fft.getBand(fft.specSize()/4) / 100.0;
  float bac = map(bassAmplitude,0,1,35,255);
  float ma = map(midAmplitude,0,1,1,4);
  float ha = map(highAmplitude,0,1,1,100);

  fill(bac); // Cambia el  color con las LF
  
  
  translate(width/2, height/2, 10 * ha ); // Las HF aumentan el tamaño del cubo.
  rotateX(radians(-30));
  rotateY(frameCount*0.002);

  float boxSize = 3;
  for (PVector p : particles) {
    pushMatrix();
    translate(p.x * 40 * ma, p.y * 40 * ma, p.z * 40 * ma );
    box(boxSize);
    popMatrix();
  }
}

void stop() {
  // Detener  Minim y borrar el contenido
  audioPlayer.close();
  minim.stop();
  super.stop();
}
