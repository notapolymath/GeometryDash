class Obstacles {
  public float x;
  public float vx;
  public Obstacles(float x) {
    this.x = x;
    this.vx = -10.0;
  }
  void moveObstacles() {
    x+= vx;
    fill(c);
    triangle(x, height-100, x + 80, height-100,
      x+ 40, height - 150);
    if (containsPoint(b.x, b.y) == true) {
      b.lives--;
      if (b.lives < 1){
      state = -1;
      }
    }
  }

  public boolean containsPoint(float px, float py) {
    return x < px && px <x+b.side && height-150 < py && height-150 <b.y+b.side;
  }
}
