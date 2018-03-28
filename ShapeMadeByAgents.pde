float[] x;
float[] y;
int shapeRes = 10;
int centerX, centerY;
float startRadius = 100;
float[] Xseeds, Yseeds;
float Xincrease = 0.1;
float Yincrease = 0.1;

void setup() {
  //size(800,800);
  fullScreen();
  noFill();
  stroke(0, 5);

  centerX = width /2;
  centerY = height/2;

  float angle = TWO_PI/shapeRes;

  x = new float[shapeRes];
  y = new float[shapeRes];

  Xseeds = new float[shapeRes];
  Yseeds = new float[shapeRes];
  for (int i =0; i < shapeRes; i++) {
    Xseeds[i] = random(10000);
    Yseeds[i] = random(10000);
  }

  for (int i = 0; i < shapeRes; i++) {
    x[i] = cos(angle *i) * startRadius;
    y[i] = sin(angle *i) * startRadius;
  }
}

void draw() {
  //background(255);
  translate(centerX, centerY);

  beginShape();

  curveVertex(x[shapeRes-1], y[shapeRes-1]);
  for (int i = 0; i < shapeRes; i++) {
    curveVertex(x[i], y[i]);

    //uncomment to visualize vertexes
    //fill(0, 2);
    //stroke(0, 5);
    //ellipse(x[i], y[i], 10, 10);
    //stroke(0, 10);
    //noFill();
  }
  curveVertex(x[0], y[0]);
  curveVertex(x[1], y[1]);

  endShape();

  for (int i = 0; i < shapeRes; i++) {
    x[i] +=noise(Xseeds[i])*4 -1.9;
    y[i] +=noise(Yseeds[i])*4 -1.9;

    Xseeds[i] += Xincrease;
    Yseeds[i] += Yincrease;
  }
}
