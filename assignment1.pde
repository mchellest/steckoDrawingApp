/* 
  Assignment 1 - Processing user input assignment by Michelle Stecko, September 2018
    - one for loop [x] 
    - two conditional statements [x]
    - mouse input [x]
    - keyboard input [x]
*/

// Brush color
int cIndex = 0;
String[] colorArr = {"White", "Red", "Green", "Blue"};
int[] bColor = {255, 255, 255}; // Brush color is initially white

// Brush type
int bIndex = 0; // keeps track of the brush
String[] brushArr = {"Circle", "Square", "Spray"}; // Array of brush names

// Current
String currBrush = brushArr[bIndex]; // 'Circle' brush is the default brush
String currColor = colorArr[cIndex];

void setup(){
  size(1000,700);
  //size(displayWidth,displayHeight);
  background(0);
  textMode(CENTER);
  // make all 'brush' types centered
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  clear(); // prints instructions on screen
  // write text intially
  text("Current brush: "+currBrush, width-150, 30);
  fill(bColor[0], bColor[1], bColor[2]);
  text("Current color: "+currColor, width-150, 60);
}

void draw(){
  // refresh the variables constantly
  currBrush = brushArr[bIndex];
  currColor = colorArr[cIndex];
  // refresh text
  text("Current brush: "+currBrush, width-150, 30);
  fill(bColor[0], bColor[1], bColor[2]);
  text("Current color: "+currColor, width-150, 60);
  
  noStroke();
  fill(bColor[0], bColor[1], bColor[2]);
  // MOUSE INPUT W CONDITIONAL STMT
  if(mousePressed){
    switch(currBrush){
      case "Circle":
        // currBrush = "Circle";
        ellipse(mouseX, mouseY, 10, 10);
        break;
      case "Square":
        // currBrush = "Square";
        rect(mouseX, mouseY, 10, 10);
        break;
      case "Spray":
        // currBrush = "Spray";
        sprayBrush(); // call spray brush function
        break;
    }
  }
}

// KEYBOARD INPUT W CONDITIONAL STMTS
void keyPressed(){
  // save screenshot
  if(key == 's' || key == 'S'){
    saveFrame("drawing-######.png");
  }
  // clear the screen
  if(key == 'r' || key == 'R'){
     clear(); // clears the screen and re-prints the instructions
  }
  // if key pressed is special/reserved name
  if(key == CODED){
    // change brush while preventing out of bounds error
    if(keyCode == RIGHT && bIndex != brushArr.length-1){
       bIndex += 1;
    }
    else if(keyCode == LEFT && bIndex != 0){
       bIndex -= 1; 
    }
    // change color
    else if(keyCode == UP && cIndex != colorArr.length-1){
       cIndex += 1;
       changeColor();
    }
    else if(keyCode == DOWN && cIndex != 0){
       cIndex -= 1;
       changeColor();
    }
    
    // clear area around brush type/color text to update the text by putting a black rectangle over it
    stroke(0);
    fill(0);
    rect(width-52, 30, 200,64);
  }
  
}

// function that clears the screen and re-writes the instructions
void clear(){
  background(0);
  // show instructions:
  textSize(16);
  fill(255);
  text("Instructions:", 20, 30);
  textSize(12);
  text("Change brush: left and right arrow keys", 20,60);
  text("Change color: up and down arrow keys", 20, 90);
  text("Clear screen: R button", 20, 120);
  text("Save screenshot: S button", 20, 150);
  
}

// function for spray brush
void sprayBrush(){
  // FOR LOOP
  for(int x = 0; x < 20; x++){
    ellipse(random(mouseX-40, mouseX+40), random(mouseY-40, mouseY+40), 1,1); 
  }
}

// function that assigns rgb values to the bColor array when changing color
void changeColor(){
  switch(colorArr[cIndex]){
    case "White":
      bColor[0] = 255;
      bColor[1] = 255;
      bColor[2] = 255;
      break;
    case "Red":
      bColor[0] = 255;
      bColor[1] = 0;
      bColor[2] = 0;
      break;
    case "Green":
      bColor[0] = 0;
      bColor[1] = 255;
      bColor[2] = 0;
      break;
    case "Blue":
      bColor[0] = 0;
      bColor[1] = 0;
      bColor[2] = 255;
      break;
  }
}
