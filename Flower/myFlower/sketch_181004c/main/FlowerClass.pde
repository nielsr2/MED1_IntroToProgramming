class Flower {
int radius;
float x;
float y;
color petalColor;
color midColor;
int petals;
Flower() {
}
void init(  int tempRadius, float tempX, float tempY, color tempPetalColor, color tempMidColor, int tempPetals) {
        radius = tempRadius;
        x = tempX;
        y = tempY;
        petalColor = tempPetalColor;
        midColor = tempMidColor;
        petals = tempPetals;
}
void display() {
        fill(petalColor);
        for (float i=0; i<PI*2; i+=2*PI/petals) {
                // float petalX = x + 20 + radius*cos(i);
                float petalX = x + radius*cos(i);
                float petalY = y + radius*sin(i);
                //ballX=width/2 + r*cos(i);
                //ballY=height/2 + r*sin(i);
                ellipse(petalX, petalY, radius, radius);
        }
        fill(midColor);
        ellipse(x, y, radius, radius);
        drawSling();
}
void bounce() {
}
float xVel, yVel;
void move(float tempxVel, float tempyVel) {
        xVel = tempxVel;
        yVel = tempyVel;
        println();
        this.boundary();
}
void move() {
        x += xVel;
        y += yVel;
        this.boundary();
}
void boundary() {
        if (x >= width || x < 0) {
                xVel = xVel * -1;
                println("X out!");
        }
        if (y >= height || y < 0) {
                yVel = yVel * -1;
                println("y out!");
        }
}
void mouseClicked() {

}
boolean clicked;
void drawSling() {
        if (clicked) {
                // line
                line(x,y,mouseX, mouseY);
        }
}
}
