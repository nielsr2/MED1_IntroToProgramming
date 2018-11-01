
class Engine {
  Obstacle[] obstacleArray;
  int totalScore;
  int levelScore;
  int level;
  int obstaclesAmount;
  int won;
  Engine() {
  }
  void startLevel(int level) {
    int i = 0;
    obstaclesAmount = 10 + (int(random(0, 5))*level);
    //obstaclesAmount = 6;
    obstacleArray = new Obstacle[obstaclesAmount];
    while (i < obstaclesAmount) {
      //int delay = int(random(5))*-100;
      int delay = (i*-100)+int(random(-50, 0));
      print(delay);
      float speed = 2 + (level/5);
      int startX = width/25 * int(random(22));
      obstacleArray[i] = new Obstacle(startX, speed, delay); // startX, speed, delay
      i++;
    }
    won = 0;
    levelScore = 0;
    levelDone = false;
  }

  String message;
  String action;
  float actionWidth;
  int actionHeight = 10;
  int actionPosX = width/2;
  int actionPosY = height/12*8;


  void UI () {
    //println(width/2);
    textAlign(RIGHT);
    text("Totalscore: " + engine.totalScore, width, 10);
    textAlign(LEFT);
    text("Score: " + engine.levelScore, 0, 10);
    textAlign(CENTER);
    text("LEVEL" + engine.level, width/2, 10);
    if (won == 1 || won == -1) {
      fill(#FF0000);
      text(percentage + "%\n" + levelScore + "/" + obstaclesAmount, width/2, height/12*3);
      //stroke(#FF0000);
      //strokeWeight(2);
      //point(actionPosX-(actionWidth/2), actionPosY - actionHeight);
      //point(((actionPosX+actionWidth)-actionWidth/2), (actionPosY));
      //println(actionPosX-(actionWidth/2));
      if (mouseX >= (actionPosX-(actionWidth/2))
        && mouseX <= int((actionPosX + actionWidth)-(actionWidth/2))
        && mouseY >= actionPosY - actionHeight
        && mouseY <= int(actionPosY + actionHeight )) {

        fill(#FFFFFF);
      }
      textAlign(CENTER);

      text(action, actionPosX, actionPosY);
      fill(#FF0000);
      text(message, width/2, height/12*6);
    }
  }
  boolean levelDone;
  int percentage;
  void calc() {
    println("CALC() RAN");
    percentage = int((float(levelScore)/obstaclesAmount) * 100);
    totalScore = totalScore + levelScore;
    println(percentage);
    if (percentage >= 80) {
      println("won", levelScore, obstaclesAmount); 
      message = "YOU WIN";
      action = "NEXT LEVEL";
      actionWidth = textWidth(action);
      won = 1;
    }  
    else if (percentage < 80) {
      //text("GAME OVER", width/2, height/12*6);
      println("lost", levelScore, obstaclesAmount);
      message = "GAME OVER";
      action = "RETRY";
      actionWidth = textWidth(action);
      won = -1;
    } else {
      println("ERR IN CALC");
    }
  }

  void refresh() {
    int i = 0;
    int dones = 0;
    while (i < obstaclesAmount && dones < obstaclesAmount) {
      obstacleArray[i].refresh();
      if (obstacleArray[i].done) {
        dones++;
      }
      i++;
      if (dones == obstaclesAmount) {
        this.levelDone = true;
        this.calc();
      }
    }
  }
}

class Obstacle {
  float rPosY = 0;
  float rPosX = 0;
  float rSpeed = 0;
  int rHeight = 25;
  int rWidth = 25;
  int rDelay;
  float rRotation = 0;
  boolean done = false;
  Obstacle(int startX, float speed, int positionelDelay) {
    rPosX = startX;
    rSpeed = speed;
    rPosY = positionelDelay;
    println("obstacles generated");
  } //https://happycoding.io/tutorials/processing/collision-detection

  void refresh() {
    //println(this.success);
    if (!this.done) {
      fill(#AA0000);
      rect(rPosX, rPosY, rHeight, rWidth);
      if (rPosX + rWidth > playerPosX && rPosX < playerPosX + playerWidth && rPosY + rHeight > playerPosY && rPosY < playerPosY + playerHeight) {
        // https://happycoding.io/tutorials/processing/collision-detection
        println("YES");
        this.done = true;
        engine.levelScore++;
         playerColor = (#FFFFFF);
      }
      if (rPosY >= 500) {
        println("NOOO");
        this.done = true;
      }
      rPosY = rPosY + rSpeed;
    }
  }
}
