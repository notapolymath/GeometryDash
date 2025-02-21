class Obstacles {
  public float x;
  public float vx;
  public Obstacles(float x) {
    this.x = x;
    this.vx = -10.0;
  }
  void moveObstacles() {
    x+= vx;
    float n = 0;
    for (int i = 0; i< count; i++) {
      n = coords[i];
      fill(c);
      triangle(n + x, height-100, n + x + 80, height-100, n+
        x+ 40, height - 150);
      //noFill();
      //noStroke();
      //rect(n+ x+ 25, height - 150, 30,50);
    }
  }
}
