float[] x;
float[] y;
int shapeRes = 200;
int centerX, centerY;
float startRadius = 300;
float[] Xseeds, Yseeds;
float Xincrease = 0.01;
float Yincrease = 0.01;

float amplitude = 50;

boolean saveFlag =false;
String folderName;

void setup() {
  //size(1440,810);
  fullScreen();
  pixelDensity(displayDensity());
  background(255);
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
  
  
  //saveWork();
}

void draw() {
  fill(255, 1);
  noFill();
  translate(centerX, centerY);

  beginShape();

  float xlength = noise(Xseeds[shapeRes-1])*amplitude*2 -amplitude;
  float ylength = noise(Yseeds[shapeRes-1])*amplitude*2 -amplitude;

  curveVertex(x[shapeRes-1]+xlength, y[shapeRes-1]+ylength);

  for (int i = 0; i < shapeRes; i++) {
    xlength = noise(Xseeds[i])*amplitude*2 -amplitude;
    ylength = noise(Yseeds[i])*amplitude*2 -amplitude;

    curveVertex(x[i]+xlength, y[i]+ylength);
  }

  xlength = noise(Xseeds[0])*amplitude*2 -amplitude;
  ylength = noise(Yseeds[0])*amplitude*2 -amplitude;
  curveVertex(x[0]+xlength, y[0]+ylength);

  xlength = noise(Xseeds[1])*amplitude*2 -amplitude;
  ylength = noise(Yseeds[1])*amplitude*2 -amplitude;
  curveVertex(x[1]+xlength, y[1]+ylength);

  endShape();

  for (int i = 0; i < shapeRes; i++) {
    Xseeds[i] += Xincrease;
    Yseeds[i] += Yincrease;
  }

  if (saveFlag) {
    saveFrame("data/Vibration/"+folderName+"/"+frameCount+".png");
  }
}

void saveWork() {
  int d = day();
  int h = hour();
  int m = minute();
  int s = second();
  folderName = d+"-"+h+":"+m+":"+s;
  PrintWriter propertyDocument = createWriter("data/Vibration/"+folderName+"/"+"@property.txt");
  propertyDocument.println("vertexNum   : " +shapeRes);
  propertyDocument.println("startRadius : " +startRadius);
  propertyDocument.println("Xincrease   : " +Xincrease);
  propertyDocument.println("Yincrease   : " +Yincrease);
  propertyDocument.println("amplitude   : " +amplitude);
  propertyDocument.flush();
  propertyDocument.close();

  saveFlag = true;
}
