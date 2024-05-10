float speed = 1; // 오른쪽으로 이동할 속도
int total_bears = 5; 
AngryBear[] 
angry_bears = new AngryBear[total_bears]; 

void setup() {
  size(800, 800);
  generateAngryBears();
}

void draw() {
  background(125);
  for (AngryBear bear : angry_bears) { 
    bear.drawBear(); 
    bear.moveRight(speed); 
  }
}

void generateAngryBears() {
  for (int i = 0; i < total_bears; i++) {
    boolean overlapping = true;
    while (overlapping) {
      float x = random(width);
      float y = random(height);
      overlapping = checkOverlap(x, y);
      if (!overlapping) {
        angry_bears[i] = new AngryBear(x, y, 100);
      }
    }
  }
}

boolean checkOverlap(float x, float y) {
  for (AngryBear bear : angry_bears) {
    if (bear != null) {
      float dx = x - bear.x;
      float dy = y - bear.y;
      float distanceSquared = dx * dx + dy * dy; 
      if (distanceSquared < 100 * 100) { 
        return true;
      }
    }
  }
  return false; 
}

class AngryBear {
  float x, y, d;

  AngryBear(float x, float y, float d) {
    this.x = x;
    this.y = y;
    this.d = d;
  }

  void drawBear() {
    noStroke();
    fill(255, 255, 255);
    ellipse(x - 0.7*d, y - 110, 60, 70);  // 왼쪽 귀
    ellipse(x + 0.7*d, y - 110, 60, 70);  // 오른쪽 귀

    fill(0);
    ellipse(x - 0.7*d, y - 110, 30, 40);  // 왼쪽 귀 안
    ellipse(x + 0.7*d, y - 110, 30, 40);  // 오른쪽 귀 안

    fill(255, 255, 255);
    ellipse(x, y, d*3, d*2 + 50);  // 얼굴

    fill(0);
    ellipse(x - 0.23*d, y + 0.4*d, 0.15*d, d/10); // 왼쪽 눈
    ellipse(x + 0.27*d, y + 0.4*d, 0.15*d, d/10); // 오른쪽 눈

    stroke(0);
    strokeWeight(3);
    line(x - 5, y + 0.45*d, x - 0.15*d, y + 0.2*d); // 미간 주름
    line(x, y + 0.41*d, x - 3, y + 0.3*d);
    line(x + 5, y + 0.43*d, x + 8, y + 0.25*d);
    line(x + 0.1*d, y + 0.45*d, x + 0.2*d, y + 0.2*d);

    strokeWeight(3);  // 턱 주름
    line(x - 3, y + 0.75*d, x - 1, y + 0.67*d);
    line(x + 3, y + 0.72*d, x + 2, y + 0.67*d);

    triangle(x - 5, y + 0.55*d, x, y + 0.6*d, x + 5, y + 0.55*d);  // 코

    strokeWeight(3);  // 입
    line(x + 0.1*d, y + 0.7*d, x, y + 0.6*d);
    line(x - 0.1*d, y + 0.7*d, x, y + 0.6*d);
  }

  void moveRight(float s) {
    x += s;
  }
}
