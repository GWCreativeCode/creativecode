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

class BlurRectangle {
  float x, y, w, h;
  color centerColor;
  float blurRadius;
  float opacity;
  int texturePoints;
  
  // Constructor
  BlurRectangle(float x, float y, float w, float h, color centerColor, float blurRadius, float opacity) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.centerColor = centerColor;
    this.blurRadius = blurRadius;
    this.opacity = opacity;
    this.texturePoints = 500;
  }
  
  // Display the blur rectangle
  void display() {
    drawBlurredShape();
    addTexture();
  }
  
  // Draw the main blurred rectangle
  void drawBlurredShape() {
    int layers = int(blurRadius * 1.5);
    
    for (int i = layers; i > 0; i--) {
      float layerProgress = map(i, 0, layers, 0, 1);
      float layerAlpha = opacity * layerProgress;
      float expansion = blurRadius * (1 - layerProgress);
      
      // Create edge color by darkening center color
      color edgeColor = color(
        red(centerColor) * 0.8,
        green(centerColor) * 0.8,
        blue(centerColor) * 0.8
      );
      
      // Interpolate between edge and center color
      color layerColor = lerpColor(edgeColor, centerColor, layerProgress);
      layerColor = color(red(layerColor), green(layerColor), blue(layerColor), layerAlpha);
      
      fill(layerColor);
      noStroke();
      
      // Draw rectangle with expansion for blur effect
      rect(x - expansion/2, y - expansion/2, w + expansion, h + expansion);
    }
  }
  
  // Add texture to the rectangle
  void addTexture() {
    for (int i = 0; i < texturePoints; i++) {
      float px = x + random(-blurRadius, w + blurRadius);
      float py = y + random(-blurRadius, h + blurRadius);
      
      if (px >= 0 && px <= width && py >= 0 && py <= height) {
        stroke(
          red(centerColor) + random(-40, 40),
          green(centerColor) + random(-30, 30),
          blue(centerColor) + random(-30, 30), 
          random(20, 80)
        );
        point(px, py);
      }
    }
  }
  
  // Update blur properties
  void setBlur(float newBlurRadius) {
    this.blurRadius = newBlurRadius;
  }
  
  void setOpacity(float newOpacity) {
    this.opacity = newOpacity;
  }
  
  void setColor(color newColor) {
    this.centerColor = newColor;
  }
  
  void setPosition(float newX, float newY) {
    this.x = newX;
    this.y = newY;
  }
  
  void setSize(float newW, float newH) {
    this.w = newW;
    this.h = newH;
  }
  
  // Animate blur (useful for interactive effects)
  void animateBlur(float time) {
    float dynamicBlur = blurRadius + sin(time) * 5;
    setBlur(dynamicBlur);
  }
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
