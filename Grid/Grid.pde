// rect(x, y, w, h)

int lastClkd_x = 50;
int lastClkd_y = 500;
int x = 50;
int y = 500;

void setup() {
  size(700, 700);
  stroke(0);
  
  background(220); // clear srcn
  drawGrid(); // draw the grid
}

void drawGrid() {
  stroke(0);
  
  for(int i = 1; i < 11; i++){
    //line(x1, y1, x2, y2)
    if(i == 1)
      strokeWeight(5);
    else
      strokeWeight(1);
    line(50*i, 25, 50*i, 525); // x lines
    
    if(i == 10)
      strokeWeight(5);
    else
      strokeWeight(1);
    line(25, 50*i, 550, 50*i); // y lines
  }
}

// mousex, mousey, width
void mouseDragged() {
  int wh = x - lastClkd_x;
  int hw = lastClkd_y - y;
  
  stroke(0,200,100);
  strokeWeight(2);
  fill(0,200,100,100);
  rect(x - wh,y, wh, hw);
  
  int v1 = wh / 50;
  int v2 = hw / 50;
  int v3 = v1 * v2;
  
  textSize(32);
  fill(0,200,100);
  text(v1 + " x " + v2 + " = " + v3, 50, 575);
}

void draw() {
  if( (mouseX % 50 <= 4) 
    && (mouseY % 50 <= 4) ) {  
    background(220); // clear srcn
    drawGrid(); // draw the grid
    
    x = round(mouseX/50) * 50;
    y = round(mouseY/50) * 50;
    
    // Cursor dot
    stroke(0,205,150);
    strokeWeight(1);
    fill(0,200,100);
    // ellipse(x,y,w,h)
    ellipse(x, y, 10, 10);
    
    if(mousePressed) {
      lastClkd_x = x;
      lastClkd_y = y;
      mousePressed = !mousePressed;
      
      System.out.println("Pressed!!");
    }
  } 
}