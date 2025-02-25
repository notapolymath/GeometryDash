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
    if (containsPoint(this.x, height-150) == true) {
      b.lives--;
      if (b.lives < 1) {
        state = -1;
      }
    }
  }

  public boolean containsPoint(float px, float py) {
    return b.x < px && px <b.x+b.side && b.y < py && py <b.y+b.side;
  }
}
