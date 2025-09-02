// Data Types and Variable Assignment - Processing Sketch
// This sketch demonstrates different data types and how to assign values to variables

// Declare and assign different data types
int circleSize = 50;           // integer - whole numbers
float xPosition = 100.5;       // float - decimal numbers  
boolean isGrowing = true;      // boolean - true or false
String message = "Hello!";     // String - text
color circleColor = color(255, 100, 150); // color - RGB values

// TODO: STUDENT TASK
// Add your own variables here! Try creating:
// 1. A float variable called "yPosition" and set it to 300.0
// 2. An int variable called "rectangleWidth" and set it to 80
// 3. A boolean variable called "showRectangle" and set it to true
// 4. A String variable called "studentName" with your name

// YOUR CODE HERE:
// float yPosition = 
// int rectangleWidth = 
// boolean showRectangle = 
// String studentName = 

void setup() {
  size(800, 600);             // Canvas size (width, height)
  textSize(16);               // Set text size for display
  println("=== Variable Values at Start ===");
  println("circleSize (int): " + circleSize);
  println("xPosition (float): " + xPosition);
  println("isGrowing (boolean): " + isGrowing);
  println("message (String): " + message);
  println("circleColor (color): " + circleColor);
}

void draw() {
  background(220);            // Light gray background
  
  // Display variable information on screen
  fill(0);                    // Black text
  text("Data Types Demo - Click to change values!", 20, 30);
  text("int circleSize = " + circleSize, 20, 60);
  text("float xPosition = " + xPosition, 20, 80);
  text("boolean isGrowing = " + isGrowing, 20, 100);
  text("String message = \"" + message + "\"", 20, 120);
  text("color circleColor = " + red(circleColor) + "," + green(circleColor) + "," + blue(circleColor), 20, 140);
  
  // TODO: STUDENT TASK - Display your new variables here
  // Add text() commands to display your variables on screen
  // Example: text("float yPosition = " + yPosition, 20, 160);
  
  // YOUR DISPLAY CODE HERE:
  
  // Use the variables to draw
  fill(circleColor);          // Use the color variable
  ellipse(xPosition, 200, circleSize, circleSize); // Use position and size variables
  
  fill(0);
  text(message, xPosition - 20, 250); // Use the string variable
  
  // TODO: STUDENT TASK - Use your variables to draw something!
  // Try drawing a rectangle using your variables:
  // if (showRectangle) {
  //   fill(100, 200, 100);  // green color
  //   rect(xPosition - rectangleWidth/2, yPosition, rectangleWidth, 40);
  //   fill(0);
  //   text(studentName, xPosition - rectangleWidth/2 + 5, yPosition + 25);
  // }
  
  // YOUR DRAWING CODE HERE:
  
  // Animate based on boolean variable
  if (isGrowing) {
    circleSize = circleSize + 1;  // Reassign variable value (increment)
    xPosition = xPosition + 0.5;  // Move circle slowly to the right
    
    // Change boolean when circle gets too big
    if (circleSize > 100) {
      isGrowing = false;        // Reassign boolean value
    }
  } else {
    circleSize = circleSize - 1;  // Reassign variable value (decrement)
    xPosition = xPosition - 0.5;  // Move circle slowly to the left
    
    // Change boolean when circle gets too small
    if (circleSize < 20) {
      isGrowing = true;         // Reassign boolean value
    }
  }
  
  // Keep circle on screen (reassign if it goes off screen)
  if (xPosition > width) {
    xPosition = 0;
  }
  if (xPosition < 0) {
    xPosition = width;
  }
}

// Interactive element - click to change values
void mousePressed() {
  // Reassign variables with new values
  circleColor = color(random(255), random(255), random(255)); // Random color
  message = "Clicked!";        // Change string
  xPosition = mouseX;          // Set position to mouse location
  circleSize = (int)random(30, 80); // Random size (casting float to int)
  
  println("=== Values Changed by Mouse Click ===");
  println("New circleSize: " + circleSize);
  println("New xPosition: " + xPosition);
  println("New message: " + message);
  println("New circleColor: " + circleColor);
}

// Reset when key is pressed
void keyPressed() {
  // Reassign variables back to original values
  circleSize = 50;
  xPosition = 100.5;
  isGrowing = true;
  message = "Hello!";
  circleColor = color(255, 100, 150);
  
  println("=== Variables Reset ===");
}
