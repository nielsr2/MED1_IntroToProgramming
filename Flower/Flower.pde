int r=60;
float ballX;
float ballY;

void setup() {
  size(600, 400);
  background(#FFFFFF);
  drawFlower(40, width/2, height/2, #FF8888, #DDAAAA, 8, 1.2);
  drawFlower(40, width/4*1, height/4*1, #FF8888, #DDBB02, 18, 1.8);
  drawFlower(60, width/4*3, height/4*3, #FF0088, #DDBB02, 18, 1.2);
  drawFlower(60, width/4*1, height/4*3, #FF0088, #A5BB02, 3, 1.5);
  drawFlower(60, width/4*1, height/4*3, #FF0088, #A5BB02, 3, 1.9);
}

//void draw(){

//  fill(#FFA005);
//  for (float i=0;i<PI*2;i+=2*PI/5) {
//  ballX=width/2 + r*cos(i);
//  ballY=height/2 + r*sin(i);
//  ellipse(ballX,ballY,r,r); 
//  }
//  fill(200,0,0);
//  ellipse(width/2,height/2,r*1.2,r*1.2);
//}  
 
 
 
 
 



void drawFlower(int radius, float ballX, float ballY, color petalColor, color midColor, int petals, float middleMultiplier) {
  fill(petalColor);
  for (float i=0; i<PI*2; i+=2*PI/petals) {
    float petalX = ballX + radius*cos(i);
    float petalY = ballY + radius*sin(i);
    //ballX=width/2 + r*cos(i);
    //ballY=height/2 + r*sin(i);
    ellipse(petalX, petalY, radius, radius);
  }
  fill(midColor);
  ellipse(ballX, ballY, radius*middleMultiplier, radius*middleMultiplier);
};
