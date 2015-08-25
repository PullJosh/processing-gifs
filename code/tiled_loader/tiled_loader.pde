import gifAnimation.*;

GifMaker gifExport;
int frames = 0;
int totalFrames = 120;

public void setup() {
  smooth();
  size(360, 360);

  gifExport = new GifMaker(this, "export.gif", 100);
  gifExport.setRepeat(0); // make it an "endless" animation
}

void draw() {
  background(255);
  fill(#3388ee);
  noStroke();


  /*pair(width / 2 - 60, height / 2 - 120);
  pair(width / 2 - 120, height / 2 - 240);
  pair(width / 2, height / 2);
  pair(width / 2 + 60, height / 2 + 120);
  pair(width / 2 + 120, height / 2 + 240);
  pair(width / 2 - 120, height / 2);
  pair(width / 2 - 240, height / 2);*/
  
  for(int x = -3; x < 3; x = x + 1) {
    for(int y = -3; y < 3; y = y + 1) {
      pair(width / 2 + 120 * x, height / 2 + 120 * y);
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

void pair(int x, int y) {
  float loopVal = sin(TWO_PI * frames / float(totalFrames));
  float loopVal2 = cos(TWO_PI * frames / float(totalFrames));
  ellipse(x, y + loopVal * 60, 20, 20);
  ellipse(x + loopVal2 * 60, y, 20, 20);
}
