// Minimal rectangles with interactions (Processing)

float[] x = {50, 80, 80};
float[] y = {50, 180, 420};
float[] w = {500, 440, 440};
float[] h = {80, 200, 280};
color[] c = {#968250, #FF8C3C, #FF6432};
float[] a = {180, 200, 190};  // opacity (0–255)

void setup() {
  size(600, 800);
  noLoop();
}

void draw() {
  background(140, 60, 50);
  noStroke();
  for (int i=0; i<3; i++) {
    fill(red(c[i]), green(c[i]), blue(c[i]), a[i]);
    rect(x[i], y[i], w[i], h[i]);
  }
}

// Interactions
void mousePressed() {                    // randomize sizes a bit
  for (int i=0; i<3; i++) {
    w[i] = constrain(w[i] + random(-60, 60), 120, width-100);
    h[i] = constrain(h[i] + random(-60, 60), 60, height-200);
  }
  redraw();
}

void keyPressed() {
  if (key=='c' || key=='C') {           // new colors
    c[0] = color(random(100,200), random(100,150), random(50,100));
    c[1] = color(random(200,255), random(100,180), random(40, 80));
    c[2] = color(random(200,255), random( 80,120), random(30, 70));
    redraw();
  }
  if (key=='o' || key=='O') {           // new opacities
    a[0] = random(120,200);
    a[1] = random(150,220);
    a[2] = random(140,210);
    redraw();
  }
}
