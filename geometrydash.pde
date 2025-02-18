Box b;
int n = 0;

void setup() {
  fullScreen();
  background(51);
  b = new Box();
  strokeWeight(16);
  line(0, height-100, width, height-100);
  strokeWeight(4);
}

void draw() {
  fill(b.c);
  stroke(255);
  square(width/2, height-b.side-100, b.side);
  int[]nums = new int[] {0, 80, 160, 240, 600, 900, 980, 1050, 2000, 280 };
  for (int i = 0; i< nums.length; i++) {
    n = nums[i];
    triangle(n + (400), height-100, n + (400) + 80, height-100, n+
      400 + 40, height - 50);
  }
}
