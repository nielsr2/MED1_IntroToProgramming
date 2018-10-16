class Flower {
int radius;
float x;
float y;
color petalColor;
color midColor;
int petals;

void collision(){
        for (int i = 0; i < flowers.length - 1; i = i +1 ) {
                // println(flowers.length, (dist(this.x, this.y, flowers[i].x, flowers[i].y)));
                if ((dist(this.x, this.y, flowers[i].x, flowers[i].y) > 0 && this.radius > (dist(this.x, this.y, flowers[i].x, flowers[i].y) )))
                         println("whoo", i, (dist(this.x, this.y, flowers[i].x, flowers[i].y)));
                        //flowers[i].move(this.sin * -1, this.cos * -1, vel / 2);
                        //break;
                // flowers[i].velX = velX * -1.;
                // flowers[i].velY = velY * -1.;
        }
}
float pull = 3.;
void randomPetals() {
        petals = int(random(5,17));
        colorMode(HSB, 100);
        petalColor = color(random(0,100),random(0,100),random(70,100));
        colorMode(RGB, 100);
};
void displayData() {
        fill(0);
        text("sin: " + sin + "\ncos: " + cos + "\nvel: " + vel, x, y);
}

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

void init(  int tempRadius, float tempX, float tempY, color tempPetalColor, color tempMidColor, int tempPetals) {
        radius = tempRadius;
        x = tempX;
        y = tempY;
        petalColor = tempPetalColor;
        midColor = tempMidColor;
        petals = tempPetals;
}

float petalRotation;
void display() {
        fill(petalColor);
        for (float i=0; i<PI*2; i+=2*PI/petals ) {
                // float petalX = x + 20 + radius*cos(i);
                if (vel > 0. ) {
                  // petalRotation += 0.1;
                  petalRotation += .1;
                  //petalRotation = ;

                  println(petalRotation);
                  //petalRotation = constrain(petalRotation, 0, 6.28);
                  //rotate(petalRotation);
                }
                float petalX = x + radius*(cos(i));
                float petalY = y + radius*(sin(i));
                //ballX=width/2 + r*cos(i);
                //ballY=height/2 + r*sin(i);

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
        //mX= sin(sin) * velX;
        //mY  = cos(cos) * velY;
        mX= (sin * velX)   * vel;
        mY  = (cos * velY) * vel;
        x += mX;
        y += mY;
        this.boundary();
        // if (velX > 0) {
        //         velX +=
        // }

        vel = constrain(vel - 0.01, 0., pull);
        //velY = constrain(velY - 0.01, 0, 10);
        // println("vel: " + vel);

        // println("sin" + sin + "\n" + "cos" + cos  + "\n" + "vel" + vel);
}
void boundary() {
        if (x >= width || x <= 0.) {
                velX = velX * -1.;

                this.randomPetals();
                // println("X out!");
        }
        if (y >= height || y <= 0.) {
                velY = velY * -1.;

                this.randomPetals();
                // println("y out!");
        }
}
void mouseClicked() {
}
boolean clicked;
void drawSling() {
        if (clicked) {
                line(x, y, mouseX, mouseY);
                float deg, hypo, adj, opp, sine;
                adj = mouseY - this.y;
                hypo = dist(this.x, this.y, mouseX, mouseY); // radius

                opp =  mouseX - this.x;
                deg = adj/hypo;
                sine = opp/hypo;
                sin = sine;
                cos = deg;
                // String infoString = "hypo: " + hypo + "adj: " + adj + "deg:" + deg + "cos deg: " + cos(deg);
                // String infoString = "sine: " + sine + "deg:" + deg;
                // text(infoString, height/2, width/2);
                displayData();
                if (clicked && !mousePressed) {
                        clicked = false;
                        this.move(sine, deg, constrain(hypo, 0., pull));
                }
        } else
        if (mousePressed == true && mouseButton == LEFT && dist(this.x, this.y, mouseX, mouseY) < this.radius) {
                // lines
                println("clicked!");
                this.clicked = true;
                // this.randomPetals();
                // if (dist(flowers[i].x,flowers[i].y, mouseX, mouseY) > flowers[i].radius) {
        }
        if (mousePressed == true && mouseButton == RIGHT && dist(this.x, this.y, mouseX, mouseY) < this.radius) {
                // line

                this.randomPetals();
                // if (dist(flowers[i].x,flowers[i].y, mouseX, mouseY) > flowers[i].radius) {
        }
}
}
