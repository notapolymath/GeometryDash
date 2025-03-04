class Box {
  //Instance variables
  public int x;
  public int y;
  public color c;
  public int side;
  public int lives;
  public float vy;
  public color eye;

  //Constructor
  public Box() {
    this.x = (width/2)-300;
    this.side = 100;
    this.c = color(15, 34, 210);
    this.eye = color(0, 170, 255);
    this.lives = 1;
    this.y = height-side-100;
    this.vy = 100;
  }
  void loseLife() {
    this.lives--;
    if (lives == 0) {
      state = -1;
    }
  }
  public void jump() {
    if (this.y == height - this.side - 100) {
      this.vy = -20;
    } else {
      start = frameCount;
    }
  }
  public void update() {
    this.y += this.vy;
    particleTrail.update(b.x, b.y);
    particleTrail.render();
    if (this.y > height - this.side - 100) {
      this.y = height - this.side - 100;
      this.vy = 0;
    } else {
      this.vy += 1.5;
    }
  }
  public void display() {
    fill(c);
    stroke(0);
    rect(-((width/2)-250)/9.5, -(b.y+50)/15, side, side, 10);
    fill(eye);
    square(-40, -40, b.side/3);
    square(0, -40, b.side/3);
    rect(-35, 5, 70, 30);
  }
}
