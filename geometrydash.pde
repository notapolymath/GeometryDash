Box b;

void setup() {
  fullScreen();
  background(51);
  b = new Box();
}

void draw() {
  fill(b.c);
  square(width/2, height-b.side, b.side);
}
