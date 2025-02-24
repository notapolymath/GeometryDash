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
  }
}
