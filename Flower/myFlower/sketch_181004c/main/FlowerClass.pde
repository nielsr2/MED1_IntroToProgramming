class Flower {
int radius;
float x;
float y;
color petalColor;
color midColor;
int petals;
float pull = 3.;
void displayData() {
        text("sin: " + sin + "\ncos: " + cos + "\nvel: " + vel, width/4, height/4*3 );
}
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
float sin, cos, vel, velX, velY;
void move(float tempSin, float tempCos, float tempVel) {
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

        println("sin" + sin + "\n" + "cos" + cos  + "\n" + "vel" + vel);
}
void boundary() {
        if (x >= width || x <= 0.) {
                velX = velX * -1.;
                // println("X out!");
        }
        if (y >= height || y <= 0.) {
                velY = velY * -1.;
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
                deg = adj/hypo;
                opp =  mouseX - this.x;
                sine = opp/hypo;
                // String infoString = "hypo: " + hypo + "adj: " + adj + "deg:" + deg + "cos deg: " + cos(deg);
                String infoString = "sine: " + sine + "deg:" + deg;
                text(infoString, height/2, width/2);
                if (clicked && !mousePressed) {
                        clicked = false;

                        //println("released", hypo, adj, deg, cos(deg));
                        // float petalX = x + radius*cos(i);
                        // float petalY = y + radius*sin(i);
                        this.move(sine, deg, constrain(hypo, 0., pull));
                }
        } else
        if (mousePressed == true && dist(this.x, this.y, mouseX, mouseY) > this.radius) {
                // line
                println("clicked!");
                this.clicked = true;
                // if (dist(flowers[i].x,flowers[i].y, mouseX, mouseY) > flowers[i].radius) {
        }
}
}
