class Flower {
int radius;
float x;
float y;
color petalColor;
color midColor;
int petals;
float gravity = 0.01;
float pull = 3.;
Flower() {
        radius = int(random(20,50));
        x = random(0,width);
        y = random(0,height);
        colorMode(HSB, 360, 255, 255);
        petalColor = color(random(0,360),random(0,255),random(0,255));
        midColor =  color(random(30,70),random(0,255),random(0,255));
        petals = int(random(4,20));
        colorMode(RGB, 100);
}

Flower(  int tempRadius, float tempX, float tempY, color tempPetalColor, color tempMidColor, int tempPetals) {
        radius = tempRadius;
        x = tempX;
        y = tempY;
        petalColor = tempPetalColor;
        midColor = tempMidColor;
        petals = tempPetals;
}
void display() {
        fill(petalColor);
        for (float i=0; i<PI*2; i+=2*PI/petals ) {
                if (vel > 0. ) {
                }
                float petalX = x + radius*(cos(i));
                float petalY = y + radius*(sin(i));
                ellipse(petalX, petalY, radius, radius);
        }
        fill(midColor);
        ellipse(x, y, radius, radius);
        drawSling();
}
float sin, cos, vel, velX, velY;
void move(float tempSin, float tempCos, float tempVel) {
        // println(this, "moved");
        // vel = constrain(tempVel, 0., 10.);
        vel = tempVel;
        sin = tempSin;
        cos = tempCos;
        velX = tempVel;
        velY = tempVel;
        //println("sin" + sin + "\n" + "cos" + cos  + "\n" + "vel" + vel);
        this.boundary();
}
float mX, mY;
void move() {

        mX= (sin * velX)   * vel;
        mY  = (cos * velY) * vel;
        x += mX;
        y += mY;
        this.boundary();
        vel = constrain(vel - gravity, 0., pull); // consta
}
void boundary() {
  // if boundary, reverse direction
        if (x >= width || x <= 0.) {
                velX = velX * -1.;
                this.randomPetals();
        }
        if (y >= height || y <= 0.) {
                velY = velY * -1.;
                this.randomPetals();
        }
}
boolean clicked;
void drawSling() {
        if (clicked) {
                line(x, y, mouseX, mouseY);
                float cosine, hypo, adj, opp, sine;
                adj = mouseY - this.y;
                hypo = dist(this.x, this.y, mouseX, mouseY); // radius
                opp =  mouseX - this.x;
                cosine = adj/hypo;
                sine = opp/hypo;
                sin = sine;
                cos = cosine;
                displayData();
                if (clicked && !mousePressed) {
                        clicked = false;
                        this.move(sine, cosine, constrain(hypo, 0., pull));
                }
        } else
        if (mousePressed == true && mouseButton == LEFT && dist(this.x, this.y, mouseX, mouseY) < this.radius) {
                // lines
                println("clicked!");
                this.clicked = true;
        }
        if (mousePressed == true && mouseButton == RIGHT && dist(this.x, this.y, mouseX, mouseY) < this.radius) {

                this.randomPetals();

        }
}
}
