
void setup() {
 //frameRate(15);
  size(500, 500);
  rectMode(CENTER);
}

float y_perlin;
float x_random;
void draw() {
  background(255);
  y_perlin = y_perlin + 0.1;
  //y_perlin = y_perlin + 0.0;
  x_random = random(0,50) * 1;
  // println("perlin: ", noise(y_perlin), "random: ", x_random);
  fill(0);
  rect(width/2 , height/2, noise(y_perlin) * 100, x_random);
  
}
