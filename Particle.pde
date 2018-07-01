public class Particle {
  private float x, y;
  private float width, height;
  public PImage sourceImage;

  public void SetPos(float x, float y) {
    this.x = x;
    this.y = y;
  }

  public void SetSize(float size) {
    this.width  = size;
    this.height = size;
  }

  public void SetImage(PImage img) {
    sourceImage = img;
  }

  public void SetColor() {
    PImage img = createImage(300, 300, ARGB);
    SetImage(img);
    float randomR = random(100, 255);
    float randomG = random(100, 255);
    float randomB = random(100, 255);
    float center = sourceImage.width/2.0f;
    for (int wi = 0; wi < sourceImage.width; wi++) {
      for (int hi = 0; hi < sourceImage.height; hi++) {
        float  distance = sqrt(sq(wi - center) + sq(hi - center));
        //if (distance < this.sourceImage.width/2) {
          float cNum = 10000/(distance);
          float R= randomR * cNum/255 - 40;
          float G= randomG * cNum/255 - 40;
          float B= randomB * cNum/255 - 40;
          
          if(distance > this.sourceImage.width/4){
            float x = distance - this.sourceImage.width/4;
            cNum -= x;
          }
          //float cNum = (1000/distance)*cos((distance+190)/150) * 25 + 110;
          //float cNum = (1000/distance)*cos((distance+200)/5) + 115;
          //float cNum = -cos(distance/100)*log(x/255)*(-distance+255);
          sourceImage.pixels[wi + hi * sourceImage.width] = color (R,G,B, cNum);
        //}
      }
    }
  }


  public void Render() {
    image(sourceImage, x, y, width, height);
  }
}
