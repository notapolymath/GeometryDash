import processing.sound.*;

SoundFile file;
SoundFile sadSound;
SoundFile levelUp;
Box b;
Obstacles[] obstacles;
ParticleTrail particleTrail;
int state = 1;
int runs = 0;
color c;
float x = 0;
int oDist = 500;
int attempts = 1;
boolean isPaused = false;
int count = 100;


void setup() {
  file = new SoundFile(this, "geometrydash.mp3");
  sadSound = new SoundFile(this, "sadSound.wav");
  levelUp = new SoundFile(this, "levelUp.wav");
  file.play();
  fullScreen();
  b = new Box();
  obstacles = new Obstacles[count];
  particleTrail = new ParticleTrail(20);
  for (int i = 0; i < count; i++) {
    obstacles[i] = new Obstacles(width+(i+1)*(b.side + oDist)+ random(-20, 20));
    if (i%3 == 0 && i > 15) {
      obstacles[i] = new Obstacles((width+i*(b.side + oDist))+b.side+ random(10));
    } else if (i%5 == 0 && i > 1 && i < 10) {
      obstacles[i] = new Obstacles(-b.side);
    } else if (i > 10) {
      obstacles[i] = new Obstacles(width+(i+1)*(b.side + oDist)+ random(-30, 30));
    }
  }
}

void draw() {
  if (isPaused == false) {
    if (state == 2) {
      stripes(100);
    } else {
      background(185, 230, 255);
    }
    updateBackground(x);
    x+=0.8;
    strokeWeight(4);
    fill(b.c);
    stroke(0);
    square(width/2-300, b.y, b.side);
    fill(b.eye);
    square(width / 2-290, b.y+10, b.side/3);
    square(width / 2-300+ b.side/2, b.y+10, b.side/3);
    rect(width/ 2-290, b.y+60, b.side-20, b.side/3);
    strokeWeight(16);
    stroke(255);
    line(0, height - 90, width, height - 100);
    strokeWeight(4);
    fill(b.c);
    b.update();
    if (b.y != height - b.side - 100) {
      fill(b.c);
      stroke(255);
      pushMatrix();
      translate ((width/2)-250, b.y+50);
      rotate (.005 * millis());
      square(-((width/2)-250)/9.5, -(b.y+50)/15, 100);
      square(-40, -40, b.side/3);
      square(0, -40, b.side/3);
      rect(-40, 0, b.side-20, b.side/3);
      popMatrix();
    }
    if (state == -1) {
      dead();
    }
    if (state == 0) {
      textSize(100);
      text("You win! Click space to try again!", 70, height/2);
    }
    if (state == 1) {
      textSize(72);
      fill(0);
      text("Attempt " + str(attempts), 50, 100);
      textSize(128);

      text("Level 1!", width/2-165, height/2);
      level1();
      runs++;
    }
    if (state == 2) {
      textSize(128);
      fill(0);
      text("Level 2!", width/2-165, height/2);
      level2();
      runs++;
    }
  }
}
void keyPressed() {
  if (state == -1) {
    if (key == ' ') {
      sadSound.stop();
      attempts++;
      restart();
    }
  } else if (state == 0) {
    if (key == ' ') {
      //sadSound.stop();
      attempts = 1;
      restart();
    }
  } else {
    if (key == ' ') {
      b.jump();
    }
    if (key == 'm') {
      isPaused = true;
    }
    if (isPaused == true) {
      if (key == 'n') {
        isPaused = false;
      }
    }
  }
}

void dead() {
  background(0);
  updateBackground(x);
  fill(b.eye);
  square(width / 2-290, b.y+10, b.side/3);
  square(width / 2-300+ b.side/2, b.y+10, b.side/3);
  rect(width/ 2-290, b.y+60, b.side-20, b.side/3);
  strokeWeight(16);
  stroke(255);
  line(0, height - 90, width, height - 100);
  fill(255, 0, 0);
  textSize(100);
  text("You Lose. T-T Click space to restart", 50, height/2);
}

void restart() {
  b.x = (width/2)-300;
  b.y=height-b.side-100;
  b.lives = 1;
  for (int i = 0; i < count; i++) {
    obstacles[i] = new Obstacles(width+(i+1)*(b.side + oDist + random(-20, 20)));
    if (i%3 == 0 && i > 15) {
      obstacles[i] = new Obstacles((width+i*(b.side + oDist))+b.side+ random(-20, 20));
    } else if (i%5 == 0 && i > 1 && i < 10) {
      obstacles[i] = new Obstacles(-b.side);
    }
    obstacles[i].vx = -10;
  }
  runs = 0;
  state =1;
}


void level1() {
  for (int i = 0; i < count; i++) {
    obstacles[i].moveObstacles();
  }

  if (runs > 800) {
    runs = 0;
    state = 2;
    levelUp.play();
  }
}

void level2() {
  for (int i = 0; i < count/2; i++) {
    obstacles[i].vx = -15;
    obstacles[i].moveObstacles();
  }
  if (runs > 800) {
    attempts = 1;
    state = 0;
  }
}

void updateBackground(float x) {
  noStroke();
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
  stroke(0);
}
void stripes(int n) {
  noStroke();
  for (float i = 0; i < n; i = i + 1) {
    fill(i*255/n, 0, (n-i) * 255/n);
    rect(i * width/n, 0, width/n, height);
  }
}
