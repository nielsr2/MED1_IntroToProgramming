


// Flower myFlower;
Flower[] flowers = new Flower[1];// = new Flower();
// ArrayList flowers = new ArrayList();
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
void setup() {
        size(600, 400);
        background(#FFFFFF);
        //drawFlower(40, width/2, height/2, #FF8888, #DDAAAA, 8, 1.2);
        //drawFlower(40, width/4*1, height/4*1, #FF8888, #DDBB02, 18, 1.8);
        //drawFlower(60, width/4*3, height/4*3, #FF0088, #DDBB02, 18, 1.2);
        //drawFlower(60, width/4*1, height/4*3, #FF0088, #A5BB02, 3, 1.5);
        //drawFlower(60, width/4*1, height/4*3, #FF0088, #A5BB02, 3, 1.9);
        //drawFlower(60, width/4*3, height/4*1, #F10081, #A5B802, 3, 1.123);
        flowers[0] = new Flower();
        // flowers = append(flowers, myFlower);
        // flowers[1] = new Flower();
        flowers[0].init(40, width/2, height/2, #FF8888, #DD00AA, 8);
        // flowers[1].init(40, width/4, height/4, #FF8888, #DD00AA, 8);
        //myFlower.move(1., 2.);
}

void draw() {
        background(#FFFFFF);
        for (int i = 0; i < flowers.length; i = i +1 ) {
                // println("whoo", i, flowers.length);
                flowers[i].display();
        flowers[i].move();
        }
        
}

void mouseClicked() {
        // for (int i = 0; i < flowers.length; i = i+1) {
        //         if (dist(flowers[i].x,flowers[i].y, mouseX, mouseY) > flowers[i].radius) {
        //                 println("YAY CLICJK");
        //                 // sling = true;
        //                 line(flowers[i].x,flowers[i].y,mouseX, mouseY);
        //         }
        // }

        for (int i = 0; i < flowers.length; i = i +1 ) {
                if (dist(flowers[i].x,flowers[i].y, mouseX, mouseY) > flowers[i].radius) {
                        // println("whoo", i, flowers.length);
                        flowers[i].clicked = true;
                        // line(flowers[i].x,flowers[i].y,mouseX, mouseY);
                }


        }
}