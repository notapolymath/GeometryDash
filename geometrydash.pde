Box b;
Obstacles[] obstacles;
int count = 20;
float[] coords;
color c;
float x = 0;

void setup() {
  fullScreen();
  b = new Box();
  coords = new float[count];
  obstacles = new Obstacles[count];
  int oDist = 300;
  for (int i = 0; i < count; i++) {
    coords[i] = (b.side + oDist) * i;
    if (i > count / 2) {
      coords[i] = (b.side + oDist - count / 10) * i;
    }
    obstacles[i] = new Obstacles(coords[i]);
  }
}

void draw() {
  background(185, 230, 255);
  for (int i = 0; i < 500; i++) {
    fill(159, 212, 243);
    rect(0+x-(width*i), 4, 3*width/40, height/6);
    rect(11*width/120+x-(width*i), 4, width/8, height/8);
    rect(7*width/30+x-(width*i), 4, 9*width/40, height/4);
    rect(19*width/40+x-(width*i), 4, 11*width/40, 5*height/12);
    rect(23*width/30+x-(width*i), 4, 13*width/60, height/12);
    rect(0+x-(width*i), 5*height/24, 13*width/60, 7*height/24);
    rect(7*width/30+x-(width*i), 7*height/24, 9*width/40, 11*height/24);
    rect(23*width/30+x-(width*i), height/8, 3*width/20, height/4);
    rect(width/60+x-(width*i), 7*height/12, width/20, 3*height/8);
    rect(11*width/120+x-(width*i), 31*height/60, width/8, 5*height/24);
    rect(3*width/20+x-(width*i), 19*height/24, 7*height/24, 5*height/24);
    rect(7*width/20+x-(width*i), 19*height/24, width/8, height/6);
    rect(width/2+x-(width*i), 11*height/24, 7*width/40, 3*height/8);
    rect(width/2+x-(width*i), 7*height/8, 7*width/40, height/8);
    rect(7*width/10+x-(width*i), 11*height/24, 3*width/40, height/8);
    rect(7*width/10+x-(width*i), 3*height/5, 3*width/40, height/8);
    rect(19*width/24+x-(width*i), 5*height/12, 11*width/60, 47*height/120);
    rect(7*width/10+x-(width*i), 33*height/40, 17*width/60, 19*height/120);
  }
  x+=0.8;
  strokeWeight(16);
  line(0, height - 100, width, height - 100);
  strokeWeight(4);
  fill(b.c);
  stroke(255);
  square(width / 2, b.y, b.side);

  for (int i = 0; i < count; i++) {
    obstacles[i].moveObstacles();
  }
  b.update();
}

void keyPressed() {
  if (key == ' ') {
    b.jump();
  }
}
