//import processing.sound.*;

//SoundFile file;
Box b;
Obstacles[] obstacles;
int state = 1;
int count = 100;
int runs = 0;
color c;
float x = 0;
int oDist1 = 300;
int oDist2 = 200;

void setup() {
  //file = new SoundFile(this, "geometrydash.mp3");
  //file.play();
  fullScreen();
  b = new Box();
  obstacles = new Obstacles[count];
  for (int i = 0; i < count; i++) {
    obstacles[i] = new Obstacles((b.side + oDist1) * i);
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
  stroke(0);
  square(width / 2, b.y, b.side);
  fill(b.eye);
  square(width / 2+10, b.y+10, b.side/3);
  square(width / 2+b.side/2, b.y+10, b.side/3);
  rect(width / 2+10, b.y+60, b.side-20, b.side/3);
  fill(b.c);
  stroke(255);
  if (state == -1) {
    textSize(100);
    text("You Lose. T-T Click space to restart", 50, height/2);
  }
  if (state == 0) {
    textSize(128);
    text("You win!", width/2-150, height/2);
  }
  if (state == 1) {
    textSize(128);
    text("Level 1!", width/2-100, height/2);
    level1();
    runs++;
  }
  if (state == 2) {
    textSize(128);
    text("Level 2!", width/2-100, height/2);
    level2();
    runs++;
  }
}

void keyPressed() {
  if (state == -1) {
    if (key == ' ') {
      state =1;
    }
  } else {
    if (key == ' ') {
      b.jump();
    }
    if (key == 'a') {
      state = -1;
    }
  }
}

void level1() {
  for (int i = 0; i < count; i++) {
    obstacles[i].moveObstacles();
  }
  b.update();
  if (runs > 1000) {
    runs = 0;
    state = 2;
  }
}

void level2() {
  for (int i = 0; i < count/2; i++) {
    obstacles[i].vx = -15;
    obstacles[i].moveObstacles();
  }
  b.update();
  if (runs > 500) {
    state = 0;
  }
}
