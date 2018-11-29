//void setup() {
//  size(400, 400);
//}
//float x, y, theta;
//float t_inc = 0.1;
//void draw() {
//  background(0);
//  x = map(sin(theta), -1., 1., 0, 200);
//  y = map(cos(theta), -1., 1., 0, 200);
//  theta += t_inc;
//  if (theta > PI/2 | theta <= PI/2 * -1 ) {
//    t_inc = t_inc * -1;
//  }
//  println(theta);
//  ellipse(x, y , 10, 10);
//}


void setup() {
  size(800, 800);
}
float x, x2, y, theta, map2;
float t_inc = 0.01;
float inc2 = TWO_PI * 0.001;

void draw() {
  background(0);
  x = map(sin(theta), -1., 1., 0, width);
  theta += t_inc;
  fill(#FFFFFF);
  ellipse(x, height/2, 10, 10);

  fill(#FF0000);
  if (map2 <= -1. || map2 >= 1. ) {
    inc2 = inc2 * -1;
  }
  x2 = map(map2, -1., 1., 0, width);
  map2 += inc2;
  println(x);
  ellipse((x2), height/2, 10, 10);
}
