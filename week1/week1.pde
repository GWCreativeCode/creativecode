// Simple Hello World using basic data structures
// Learning: arrays, for loops, and colors

// Array of colors (data structure #1)
color[] colors = {
  color(255, 0, 0),    // red
  color(0, 255, 0),    // green  
  color(0, 0, 255),    // blue
  color(255, 255, 0),  // yellow
  color(255, 0, 255)   // magenta
};

// Array of letters (data structure #2)
char[] letters = {'H', 'E', 'L', 'L', 'O', ' ', 'W', 'O', 'R', 'L', 'D'};

void setup() {
  size(600, 200);
  textSize(30);
  textAlign(CENTER);
}

void draw() {
  background(50);
  
  // Use a for loop to draw each letter
  for (int i = 0; i < letters.length; i++) {
    
    // Pick a color from our colors array
    fill(colors[i % colors.length]);  // % keeps index in bounds
    
    // Calculate position for each letter
    float x = 50 + i * 45;  // space letters 45 pixels apart
    float y = height/2;
    
    // Draw the letter
    text(letters[i], x, y);
  }
  
  // Show what we learned
  fill(255);
  textSize(12);
  text("Used arrays for colors and letters + for loop to display them!", width/2, height - 30);
}