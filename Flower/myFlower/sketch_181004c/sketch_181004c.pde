ArrayList<Flower> flowers = new ArrayList<Flower>();
void setup() {
        size(600, 400);
        background(#FFFFFF);
        flowers.add(new Flower(40, width/2, height/2, #FF8888, #DDAAAA, 7));
        flowers.add(new Flower(60, width/4*3, height/4*1, #F10081, #A5B802, 3));
        flowers.add(new Flower());
}

void draw() {

        background(#FFFFFF);
        for (int i = 0; i < flowers.size(); i = i +1 ) {
                Flower flower = flowers.get(i);
                flower.display();
                flower.displayData();
                flower.move();
        }
        textAlign(CENTER);
        text("click to creat new flower, drag flower to sling it", width/2, height/10*9);
}
//
void mouseClicked() {
        flowers.add(new Flower(mouseX, mouseY));
}
