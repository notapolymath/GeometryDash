class Box {
  //Instance variables
  public int x;
  public int y;
  public color c;
  public int side;
  public int lives;
  //Constructor
  public Box() {
    this.x = width/2;
    this.y = height-b.side-100;
    this.side = 100;
    this.c = color(random(256), random(256), random(256));
    this.lives = 10;
  }
}
