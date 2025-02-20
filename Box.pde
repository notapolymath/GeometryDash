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
    if (this.y == height - this.side - 100) {  
      this.vy = -15; 
    }
  }
  public void update() {
    this.y += this.vy;  

    if (this.y > height - this.side - 100) {  
      this.y = height - this.side - 100;
      this.vy = 0;  
    } else {
      this.vy += 1;  
    }
  }
}
