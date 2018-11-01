
Engine engine;
void setup() {
  size(550, 500);
  engine = new Engine();
  engine.startLevel(1);
}

int playerPosX = 250;
int playerPosY = 450;
int playerWidth = 50;
int playerHeight = 50;
color playerColor = (#FF0000);

int fallingPosY = 0;
int fallingPosX = 0;
int score = 0;
int level = 0;

void draw() {
  playerColor = (#FF0000);
  background(0);
  if (engine.levelDone == false) {
    engine.refresh();
  }
  engine.UI();
  fill(playerColor);
  rect(playerPosX, playerPosY, playerHeight, playerWidth);
}

void keyPressed() {
  if (keyCode == LEFT && playerPosX != 0) {
    //println("left accepted");
    playerPosX = playerPosX - 50;
  }
  if (keyCode == RIGHT && playerPosX != 500) {
    playerPosX = playerPosX + 50;
  }
  if (key == 'a') {
    playerPosX = 0;
  }
  if (key == 'd') {
    playerPosX = width-playerWidth;
  }
}

void mouseClicked() {
  if (mouseX >= (engine.actionPosX-(engine.actionWidth/2))
    && mouseX <= int((engine.actionPosX + engine.actionWidth)-(engine.actionWidth/2))
    && mouseY >= engine.actionPosY - engine.actionHeight
    && mouseY <= int(engine.actionPosY + engine.actionHeight )) {
    if (engine.won == -1) {
      setup();
    } else if (engine.won == 1) {
      engine.level++;
      engine.startLevel(engine.level);
    }
  }
}
