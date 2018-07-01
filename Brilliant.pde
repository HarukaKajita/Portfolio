int particleNum = 100; 
Particle[] particles = new Particle[particleNum];


void setup(){
  //size(1400,800);
  //fullScreen();
  size(3840, 2160);
  blendMode(SCREEN);
  //hint(DISABLE_DEPTH_TEST);
  background(0);
  
  for (Particle prt : particles) {
    float minSize = 100, maxSize = 300;
    prt = new Particle();
    prt.SetSize(random(minSize, maxSize));
    prt.SetPos(random(0-((maxSize-minSize)/2), width), random(0-((maxSize-minSize)/2),height));
    prt.SetColor();
  	prt.Render();
  }
  
}

int updateIndex = 0;
int preT = 0;

//void draw(){
//  //background(0);
//  int T = millis();
  
//    if(T - preT > 10){
//    particles[updateIndex] = new Particle();
//    particles[updateIndex].SetColor();
//    particles[updateIndex].SetSize(random(30, 150));
//    particles[updateIndex].SetPos(random(0, 1400), random(0, 800));
//    particles[updateIndex].Render();
//    preT = T;
//    updateIndex++;
//    if(updateIndex >= particleNum){updateIndex = 0;}
//  }
//}