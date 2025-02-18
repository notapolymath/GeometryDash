Box b;
Obstacles[] obstacles;
int count = 100;
int oDist = 200;
float[]coords;
color c = color(random(256), random(256), random(256));

void setup() {
  fullScreen();
  b = new Box();
  coords = new float[count];
  obstacles = new Obstacles[count];
  for (int i = 0; i < count; i++) {
    coords[i] = oDist*i;
    obstacles[i]= new Obstacles(coords[i]);
  }
}

void draw() {
  background(0);
  strokeWeight(16);
  line(0, height-100, width, height-100);
  strokeWeight(4);
  fill(b.c);
  stroke(255);
  square(width/2, height-b.side-100, b.side);
  for (int i = 0; i < count; i++) {
    obstacles[i].moveObstacles();
  }
}
