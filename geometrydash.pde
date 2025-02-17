void setup() {
  fullScreen();
  background(51);
  color c = color(random(256), random(256), random(256));
  fill(c);
  int size = 100;
  square(width/2, height-size, size);
}

void draw() {
  rect(width/2, height, 100,100);
}
