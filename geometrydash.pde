Box b;

void setup() {
  fullScreen();
  background(51);
  b = new Box();
  strokeWeight(16); 
  line(0, height-100, width, height-100);
  strokeWeight(4);
}

void draw() {
  fill(b.c);
  stroke(255);
  square(width/2, height-b.side-100, b.side);
}
