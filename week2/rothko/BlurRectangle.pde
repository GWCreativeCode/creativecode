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
