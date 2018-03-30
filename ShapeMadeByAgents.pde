float[] x;
float[] y;
int shapeRes = 1000;
int centerX, centerY;
float startRadius = 0;
float[] seeds;
float increase = 0.8;
float angle;

float deltaLength = 2.5;//maximum delta

void setup() {
  //size(800,800);
  fullScreen();
  background(255);
  pixelDensity(displayDensity());
  noFill();
  stroke(0, 20);

  centerX = width /2;
  centerY = height/2;

  angle = TWO_PI/shapeRes;

  x = new float[shapeRes];
  y = new float[shapeRes];

  seeds = new float[shapeRes];
  for (int i =0; i < shapeRes; i++) {
    seeds[i] = random(10000);
  }

  for (int i = 0; i < shapeRes; i++) {
    x[i] = cos(angle *i) * startRadius;
    y[i] = sin(angle *i) * startRadius;
  }
}

void draw() {
  translate(centerX, centerY);

  beginShape();

  curveVertex(x[shapeRes-1], y[shapeRes-1]);
  for (int i = 0; i < shapeRes; i++) {
    curveVertex(x[i], y[i]);
  }
  curveVertex(x[0], y[0]-0.5); 
  curveVertex(x[1], y[1]);

  endShape();

  for (int i = 0; i < shapeRes; i++) {
    float length = noise(seeds[i])* deltaLength*2 -deltaLength;
    x[i] -= cos(angle*i) * length;
    y[i] -= sin(angle*i) * length;
    seeds[i] += increase;
  }
}

void keyPressed(){
  if(key == 's'){
    save("data/NormalDirection/" + frameCount + ".png");
  }
}
