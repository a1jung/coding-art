float x1,y1,d1;
float x3,y3,d3,vx3,vy3;
int alive = 1;
int hold = 0;
int time=0;
int s, ms;
int count=1;
void setup(){
  size(600,900);
  frameRate(40);
   for (int i = 0; i < 400; i++) {
  float r1 = random(300);
  float r2 = random(300);
  x1=300; y1=850; d1=50; 
  x3=r1; y3=r2; d3=100; vx3=57; vy3=65; // 시작위치 난수 설정
}
}
void draw(){
   time++;  // suh
 if (alive != 0) {
    background(0);
    if(count==1){
    s = time/40;
    ms = (time%40)*25;
     // count=0;   // suh
    }
    if (distance()< 60){
     fill(0,250,0);
     textSize(60);
     text("GAME OVER", 150, height/2);
     alive = 0;}

  fill(0,250,0);
  textSize(50);
  if( count == 1){
    if((time%40)*25 < 100) text(time/40 + ":0" + (time%40)*25, 250, 80);
    else text(time/40 + ":" + (time%40)*25, 250, 80);
  }
  if(count == 0){
    if(ms < 100) text(s + ":0" + ms, 250, 80);
    else text(s + ":" + ms, 250, 80);
  }
  one(x1,y1,d1);
   if(x1<25) x1 = 25;
   if(x1>575) x1 = 575;
   if(y1<25) y1 = 25;
   if(y1>875) y1 = 875;
    
  ENEMY(x3,y3,d3);
   x3 += vx3;
   y3 += vy3;
  if(x3<50 || x3>555) vx3 = -vx3;
  if(y3<50 || y3>845) vy3 = -vy3;
 }
}
float distance(){
  float dx,dy,dd;
  dx = x1-x3;
  dy = y1-y3;
  dd = sqrt(dx*dx + dy*dy);
  return dd;
}
void mouseMoved(){
  x1 = mouseX;
  y1 = mouseY;
  }
