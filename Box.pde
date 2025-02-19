class Box {
  //Instance variables
  public int x;
  public int y;
  public color c;
  public int side;
  public int lives;
  public int vy;

  //Constructor
  public Box() {
    this.x = width/2;
    this.y = height-this.side-100;
    this.side = 100;
    this.c = color(random(256), random(256), random(256));
    this.lives = 10;
    this.y = height-side-100;
    this.vy = 100;
  }
  void loseLife() {
    this.lives--;
  }
  public void jump() {
    if (this.y == height - this.side - 100) {  // Only jump if the box is on the ground
      this.vy = -15;  // Set negative velocity for jump
    }
  }
  public void update() {
    this.y += this.vy;  // Update position based on vertical velocity

    if (this.y > height - this.side - 100) {  // Make sure the box doesn't fall below the ground
      this.y = height - this.side - 100;
      this.vy = 0;  // Stop falling when the box hits the ground
    } else {
      this.vy += 1;  // Simulate gravity by increasing downward velocity
    }
  }
}
