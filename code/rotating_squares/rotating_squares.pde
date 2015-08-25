import gifAnimation.*;

GifMaker gifExport;
int frames = 0;
int totalFrames = 158;
float dir = 0;

public void setup() {
  smooth();
  size(480, 360);

  gifExport = new GifMaker(this, "export.gif", 100);
  gifExport.setRepeat(0); // make it an "endless" animation

  rectMode(CENTER);
  noStroke();
}

void draw() {
  dir = dir + 0.02;
  
  if(frames < ceil(totalFrames / 2)) {
    background(#1C202B);
    fill(#BABECC);
    for(int n = -1; n < 14; n = n+1) {
      for(int i = -1; i < 10; i = i+1) {
        pushMatrix();
        if(n % 2 == 0) {
          translate(i * 60 + 15, n * 30 + 15);
        } else {
          translate(i * 60 + 45, n * 30 + 15);
        }
        rotate(dir);
        rect(0, 0, 30, 30);
        popMatrix();
      }
    }
  } else {
    background(#BABECC);
    fill(#1C202B);
    for(int n = -1; n < 14; n = n+1) {
      for(int i = -1; i < 10; i = i+1) {
        pushMatrix();
        if(n % 2 == 0) {
          translate(i * 60 + 45, n * 30 + 15);
        } else {
          translate(i * 60 + 15, n * 30 + 15);
        }
        rotate(dir);
        rect(0, 0, 30, 30);
        popMatrix();
      }
    }
  }
  
  
  export();
}

void export() {
  if(frames < totalFrames) {
    gifExport.setDelay(20);
    gifExport.addFrame();
    frames++;
  } else {
    gifExport.finish();
    frames++;
    println("gif saved");
    exit();
  }
}
