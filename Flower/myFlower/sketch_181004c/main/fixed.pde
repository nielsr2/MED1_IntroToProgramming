//class Flower2 {
//  int radius;
//  float x;
//  float y;
//  color petalColor;
//  color midColor;
//  int petals;
//  Flower() {
//  }
//  void init(  int tempRadius, float tempX, float tempY, color tempPetalColor, color tempMidColor, int tempPetals) {
//    radius = tempRadius;
//    x = tempX;
//    y = tempY;
//    petalColor = tempPetalColor;
//    midColor = tempMidColor;
//    petals = tempPetals;
//  }
//  void display() {
//    fill(petalColor);
//    for (float i=0; i<PI*2; i+=2*PI/petals) {
//      float petalX = x + radius*cos(i);
//      float petalY = y + radius*sin(i);
//      ellipse(petalX, petalY, radius, radius);
//    }
//    fill(midColor);
//    ellipse(x, y, radius, radius);
//    drawSling();
//  }
//  void drawSling() {
//    if (clicked) {
//      line(x, y, mouseX, mouseY);
//      float deg, hypo, adj, opp, sine;
//      adj = mouseY - this.y;
//      hypo = dist(this.x, this.y, mouseX, mouseY); // radius
//      deg = adj/hypo;
//      opp =  mouseX - this.x;
//      sine = opp/hypo;
//      String infoString = "sine: " + sine + "deg:" + deg ;
//      text(infoString, height/2, width/2);
//      if (clicked && !mousePressed) {
//        clicked = false;
//        this.move(sine, deg, 2);
//      }
//    } else
//      if (mousePressed == true && dist(this.x, this.y, mouseX, mouseY) > this.radius) {
//        // line
//        println("clicked!");
//        this.clicked = true;
//        // if (dist(flowers[i].x,flowers[i].y, mouseX, mouseY) > flowers[i].radius) {
//      }
//  }
//}
