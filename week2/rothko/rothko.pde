// Rectangle instances
BlurRectangle topBand, middleRect, bottomRect;

void setup() {
  size(600, 800);
  
  // Create blur rectangles with different properties
  topBand = new BlurRectangle(50, 50, width - 100, 80, 
                             color(150, 130, 80), 25, 180);
  
  middleRect = new BlurRectangle(80, 180, width - 160, 200, 
                                color(255, 140, 60), 35, 200);
  
  bottomRect = new BlurRectangle(80, 420, width - 160, 280, 
                                color(255, 100, 50), 30, 190);
  
  noLoop(); // Static image
}

void draw() {
  // Background - deep red/maroon
  background(140, 60, 50);
  
  // Add texture to background
  addBackgroundTexture();
  
  // Draw blur rectangles
  topBand.display();
  middleRect.display();
  bottomRect.display();
  
  // Add subtle color bleeding effects
  addColorBleeding();
}

void addBackgroundTexture() {
  for (int i = 0; i < 2000; i++) {
    stroke(red(color(140, 60, 50)) + random(-30, 30),
           green(color(140, 60, 50)) + random(-20, 20),
           blue(color(140, 60, 50)) + random(-20, 20), 
           random(10, 40));
    point(random(width), random(height));
  }
}

void addColorBleeding() {
  // Add subtle gradients between sections
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      // Add some color variation and bleeding
      if (random(1) < 0.01) {
        float distance = dist(x, y, width/2, height/2);
        float intensity = map(distance, 0, width/2, 100, 20);
        
        stroke(255, 120, 60, intensity * 0.3);
        point(x, y);
      }
    }
  }
}

// Interactive features
void mousePressed() {
  // Randomize blur properties on click
  topBand.setBlur(random(15, 35));
  middleRect.setBlur(random(25, 45));
  bottomRect.setBlur(random(20, 40));
  
  redraw();
}

void keyPressed() {
  if (key == 'c' || key == 'C') {
    // Change colors
    topBand.setColor(color(random(100, 200), random(100, 150), random(50, 100)));
    middleRect.setColor(color(random(200, 255), random(100, 180), random(40, 80)));
    bottomRect.setColor(color(random(200, 255), random(80, 120), random(30, 70)));
    redraw();
  }
  
  if (key == 'o' || key == 'O') {
    // Change opacity
    topBand.setOpacity(random(120, 200));
    middleRect.setOpacity(random(150, 220));
    bottomRect.setOpacity(random(140, 210));
    redraw();
  }
}
