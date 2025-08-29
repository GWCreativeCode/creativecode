// --- Simple Blurred Rectangles (no classes) ---
float[] xs = {50, 80, 80};
float[] ys = {50, 180, 420};
float[] ws = {600-100, 600-160, 600-160};
float[] hs = {80, 200, 280};
color[] cols = {#968250, #FF8C3C, #FF6432};
float[] blurs = {25, 35, 30};
float[] opacs = {180, 200, 190};

void setup() {
  size(600, 800);
  noLoop(); // static until user interacts
}

void draw() {
  background(140, 60, 50);
  backgroundTexture(2000);
  for (int i=0; i<3; i++) drawBlurRect(xs[i], ys[i], ws[i], hs[i], cols[i], blurs[i], opacs[i]);
  colorBleed(0.01);
}

void drawBlurRect(float x, float y, float w, float h, color c, float blur, float baseA) {
  int layers = int(blur*1.5);
  for (int i=layers; i>0; i--) {
    float t = map(i, 0, layers, 0, 1);
    float expand = blur*(1-t);
    color edge = color(red(c)*0.8, green(c)*0.8, blue(c)*0.8);
    color cc = lerpColor(edge, c, t);
    fill(red(cc), green(cc), blue(cc), baseA*t);
    noStroke();
    rect(x-expand/2, y-expand/2, w+expand, h+expand);
  }
  // quick texture sprinkle
  strokeWeight(1);
  for (int k=0; k<300; k++) {
    stroke(red(c)+random(-40,40), green(c)+random(-30,30), blue(c)+random(-30,30), random(20,80));
    point(x+random(-blur, w+blur), y+random(-blur, h+blur));
  }
}

void backgroundTexture(int n) {
  for (int i=0; i<n; i++) {
    stroke(140+random(-30,30), 60+random(-20,20), 50+random(-20,20), random(10,40));
    point(random(width), random(height));
  }
}

void colorBleed(float chance) {
  stroke(255,120,60, 30);
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) if (random(1)<chance) point(x,y);
  }
}

// --- Interactions ---
void mousePressed() { // randomize blur
  for (int i=0; i<3; i++) blurs[i] = random(20,45);
  redraw();
}
void keyPressed() {
  if (key=='c' || key=='C') { // new colors
    cols[0] = color(random(100,200), random(100,150), random(50,100));
    cols[1] = color(random(200,255), random(100,180), random(40,80));
    cols[2] = color(random(200,255), random(80,120),  random(30,70));
    redraw();
  }
  if (key=='o' || key=='O') { // new opacities
    opacs[0] = random(120,200);
    opacs[1] = random(150,220);
    opacs[2] = random(140,210);
    redraw();
  }
}
