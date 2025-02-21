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
    this.x = width/2;
    this.y = height-this.side-100;
    this.side = 100;
    this.c = color(15, 34, 210);
    this.eye = color(0,170, 255);
    this.lives = 10;
    this.y = height-side-100;
    this.vy = 100;
  }
  void loseLife() {
    this.lives--;
  }
  public void jump() {
    if (this.y == height - this.side - 100) {
      this.vy = -16;
    }
  }
  public void update() {
    this.y += this.vy;
    if (this.y > height - this.side - 100) {
      this.y = height - this.side - 100;
      this.vy = 0;
    } else {
      this.vy += 1.5;
    }
  }
}
