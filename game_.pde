Orb[] o;
int numOrbs = 5;
float attractRadius = 50.0;
float attractX = 640.0;
float attractY = 360.0;
float step = 0.001;

float ballX= 100;
float ballY = 400;
float ballSpeedX = 20;
float ballSpeedY=0;
float ballDiameter = 20;
float ln=0;
boolean start= false;
boolean hit=false;
int score = 0;

int level=1;
int miss=0;
color c1 = color(255,0,0);
color c2 = color(0,255,0);
color c3 = color(0,0,255);
color[] colArray = {c1, c2, c3};
boolean collision, collision1, collision2, collision3, collision4,collision5, collision6;


void setup() {
 background(240);
 size(1280, 720);
  
 o = new Orb[numOrbs];

 for (int i=0; i<numOrbs; i++){
   o[i] = new Orb(80*i, 50*i, 30);
 }
 

}

void draw() {
 background(169,207,240);
 
 stroke(0);
 
 textSize(32);
    fill(0, 102, 153, 204);
    text("click the mouse" , 100, 100, -30); 
 fill(0);
  ellipse(ballX, ballY, ballDiameter, ballDiameter);
  noFill();
 
    textSize(32);
    fill(0, 102, 153, 204);
    text("Score:"+score, 300, 45, -30); 
 for (int i=0; i<numOrbs; i++) {

   o[i].display();
   o[i].move();
 }
 

   
 if(start==true&&miss<=5){
  ballX = ballX + ballSpeedX;
  ballY = ballY + ballSpeedY;
  if (ballX > width - ballDiameter) {
    ballX = 150;
    ballY = height/2;
    start = false;
    miss++;
  }
 }
 if(miss>=6)
 {  textSize(32);
    fill(0, 102, 153, 204);
    text("you lost:(", 500, 45, -30); 
    o[0].frequency=4;
    text("start over", 10, 10, 340, 80);
 }
 if(score>=6)
 {
    textSize(32);
    fill(0, 102, 153, 204);
    text("you win!!", 500, 45, -30); 
    text("start over", 10, 10, 340, 80);
   
    
    
 }
   
 
//  println(ballX);
  collision = hit(ballX, ballY, ballDiameter/2, o[4].px,o[4].py,o[0].radius);
  collision1 = hit(ballX, ballY, ballDiameter/2, o[4].px1,o[4].py1,o[0].radius);
  collision2 = hit(ballX, ballY, ballDiameter/2, o[4].px2,o[4].py2,o[0].radius);
 collision3 = hit(ballX, ballY, ballDiameter/2, o[4].px3,o[4].py3,o[0].radius);
 collision4 = hit(ballX, ballY, ballDiameter/2, o[4].px4,o[4].py4,o[0].radius);
collision5 = hit(ballX, ballY, ballDiameter/2, o[4].px5,o[4].py5,o[0].radius);
  collision6 = hit(ballX, ballY, ballDiameter/2, o[4].px6,o[4].py6,o[0].radius);
// ln=pow(ballX,2) + pow(o[5].x+200-ballY,2);
// println(o[4].px1);

if(ballX<650){
 if ((collision == true)|| (collision1 == true) ||(collision2 == true) ||(collision3 == true) ||(collision4 == true)||(collision5 == true) ||(collision6 == true) )
 {
    textSize(32);
    fill(0, 102, 153, 204);
    text("good job", 500, 45, -30); 
    ballX= 100;
    start=false;
    score++;
    o[4].frequency+=0.1;
    o[0].frequency++;
 }
}

 }

//  else if(ballX>width + ballDiameter){
// 
//    if(start=true){
//    ballX = ballX + ballSpeedX;
//  ballY = ballY + ballSpeedY;
//  if ((ballX > width + ballDiameter) || (ballX < -ballDiameter)) {
//    ballX = 150;
//    ballY = height/2;
//    ballSpeedX = 3;
//    ballSpeedY = 0;
//  }
//  }
//  }


          

class Orb {
 float x, y; // x-coordinate, y-coordinate
 float radius;
 
 float angle;
 float px, py,px1, py1,px2, py2, px3,py3, px4,py4,px5,py5,px6,py6;
 float frequency = 4;
 
 // Constructor
 Orb(float xpos, float ypos, float rad) {
   x = xpos;
   y = ypos;
   radius = rad;
 }
 
 void display() {
   smooth();
   noStroke();
   ellipseMode(CENTER);
   stroke(100);
  
     fill(colArray[int(random(3))]);
  
   ellipse(px, py, radius, radius);
   ellipse(px1, py1, radius, radius);
   ellipse(px2, py2, radius, radius);
   ellipse(px3, py3, radius, radius);
   ellipse(px4, py4, radius, radius);
   ellipse(px5, py5, radius, radius);
   ellipse(px6, py6, radius, radius);
   
   
 }
 
 void move() {
   
   px = attractX + cos(radians(angle)) * ((attractRadius + x)/2);
   py = attractY + sin(radians(angle)) * ((attractRadius + x)/2);

   px1 = attractX + cos(PI/3 + radians(angle)) * ((attractRadius + x)/2);
   py1 = attractY + sin(PI/3 +radians(angle)) * ((attractRadius + x)/2);
   
   px2 = attractX + cos(2*PI/3 + radians(angle)) * ((attractRadius + x)/2);
   py2 = attractY + sin(2*PI/3 +radians(angle)) * ((attractRadius + x)/2);
   
   px3 = attractX + cos(PI + radians(angle)) * ((attractRadius + x)/2);
   py3 = attractY + sin(PI +radians(angle)) * ((attractRadius + x)/2);
   
   px4 = attractX + cos(4*PI/3 + radians(angle)) * ((attractRadius + x)/2);
   py4 = attractY + sin(4*PI/3 +radians(angle)) * ((attractRadius + x)/2);
   
   px5 = attractX + cos(5*PI/3+ radians(angle)) * ((attractRadius + x)/2);
   py5 = attractY + sin(5*PI/3 +radians(angle)) * ((attractRadius + x)/2);
   
   px6 = attractX + cos(2*PI+ radians(angle)) * ((attractRadius + x)/2);
   py6 = attractY + sin(2*PI +radians(angle)) * ((attractRadius + x)/2);
   angle -= frequency;

   
 }
}
void mouseClicked(){
  if (score<=5){
  start= true;
  }
  if(mouseX>10&&mouseX<350&&mouseY>10&&mouseY<90){
  miss=0;
  score=0;
  setup();
  }
}

boolean hit(float bx, float by, float br, float hx, float hy,float hr) {
 
  float circleDistanceX = abs(hx - bx );
  float circleDistanceY = abs(hy - by );
  if ((pow(circleDistanceX,2) + pow(circleDistanceY,2))<=pow(br+hr,2))
  { return true; }
  
  return false;
 
 
//  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
//  return cornerDistance <= pow(cr, 2);
}
   
