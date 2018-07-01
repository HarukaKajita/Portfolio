
int vertexNum = 100;
PVector vertexes[];
float diameter = 700;

void setup(){
  size(800,800);
  pixelDensity(displayDensity());
  
  vertexes = new PVector[vertexNum];
  for(int i = 0; i < vertexNum; i++){
    
    float x = sin(i * TWO_PI/vertexNum) * diameter/2;
    float y = cos(i * TWO_PI/vertexNum) * diameter/2;
    vertexes[i] = new PVector(x, y);
  }
  noLoop();
  imageMode(CENTER);
}

void draw(){
  translate(width/2,height/2);
  background(255);
  
  PGraphics shadow = createGraphics((int)diameter + 20,(int)diameter + 20);
  shadow.beginDraw();
  shadow.translate(shadow.width/2, shadow.height/2);
  shadow.background(255);
  for(int i = 0; i < vertexNum; i++){
    for(int j = i+1; j < vertexNum; j++){
      float distance = vertexes[i].dist(vertexes[j]);
      if(distance < diameter - 10){
        color c = color(255,0,0, 255 * cos((HALF_PI) * distance/diameter));
        shadow.stroke(c);
        shadow.line(vertexes[i].x, vertexes[i].y, vertexes[j].x, vertexes[j].y);
      } else {
        color c = color(255, 0, 0, 10);//ハードコード
        stroke(c);
       line(vertexes[i].x, vertexes[i].y, vertexes[j].x, vertexes[j].y);
      }
    }
  }
  shadow.filter(BLUR,5);
  shadow.endDraw();
  image(shadow,0,0);
  
  for(int i = 0; i < vertexNum; i++){
    for(int j = i+1; j < vertexNum; j++){
      float distance = vertexes[i].dist(vertexes[j]);
     
      color c = color(0, 255 * cos((HALF_PI) * distance/diameter));
      if(alpha(c) < 1){
        c = color(0, 1);//ハードコード
      }
      stroke(c);
      line(vertexes[i].x, vertexes[i].y, vertexes[j].x, vertexes[j].y);
      
    }
  }
  
}

void keyPressed(){
  if(key == 's'){
    saveFrame("shadow-red-" + vertexNum + ".png");
  }
}
