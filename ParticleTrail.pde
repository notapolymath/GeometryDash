import java.util.LinkedList;
import java.util.Queue;
import java.util.Random;

public class ParticleTrail {
  public Queue<Particle> trail;
  public int maxTrailSize;
  public Random random;
  class Particle {
    public float x;
    public float vx;
    public float y;
    public float vy;

    public Particle(float x, float vy) {
      this.x = x-10;
      this.vx = 5;
      this.y = b.y + b.side - 10 ;
      this. vy = vy;
    }

    public void update() {
      this.x -= this.vx;
      this.y += this.vy;
    }
  }

  public ParticleTrail(int maxTrailSize) {
    this.trail = new LinkedList<>();
    this.maxTrailSize = maxTrailSize;
    this.random = new Random();
  }

  public void update(float playerX, float playerY) {
    for (Particle p : trail) {
      p.update();
    }
    if (trail.size() >= maxTrailSize) {
      trail.poll();
    }
    float randomOffset = (random.nextFloat() - 0.5) * 10;
    float delay = (0.5 - 0.05*randomOffset);
    trail.add(new Particle(playerX + randomOffset, delay));
  }

  public void render() {
    for (Particle p : trail) {
      noStroke();
      fill(0, 255, 0);
      square(p.x, p.y, 10);
    }
  }
}
