import gifAnimation.*;

GifMaker gifExport;
int frames = 0;
int totalFrames = 120;

public void setup() {
  smooth();
  size(400, 400);

  gifExport = new GifMaker(this, "export.gif", 100);
  gifExport.setRepeat(0); // make it an "endless" animation
  
  noStroke();
}

void draw() {
  background(0);
  float dir = PI * frames / float(totalFrames);
  fill(255);
  ellipse(width / 2, height / 2, 100, 100);
  fill(0);
  rectPts(width / 2 + sin(dir) * -100,height / 2 + cos(dir) * -100, width/2 + sin(dir) * 100, height / 2 + cos(dir) * 100);
  
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

void rectPts(float x1, float y1, float x2, float y2) {
  rect(x1, y1, x2 - x1, y2 - y1);
}
