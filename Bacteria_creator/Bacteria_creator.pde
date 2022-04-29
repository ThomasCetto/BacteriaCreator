void setup(){
  size(800, 800);
  fill(255);
  background(0);
 
  //noiseDetail(8, 0.8);
  float xOff=0;
  float yOff=0;
  loadPixels();
  for(int x=0; x<width; x++){
    yOff=0;
    for(int y=0; y<height; y++){
       float n = noise(xOff, yOff);
       n = map(n, 0, 1, 180, 255);
       color c = color(n);
       pixels[x + y*width] = c;
       
       yOff+=0.02;
    }
    xOff+=0.02;
   
  }
 
  updatePixels();
 
  noFill();
  strokeWeight(2);
  ellipse(400, 400, radius*2, radius*2);
  int nPoints = drawPoints();
  textSize(20);
  text("Number of points inside the circle: " + nPoints, 250, 50);
 
}

int numberOfPoints=300;
int radius = 300;

int drawPoints(){
  fill(0);
 int counter=0;
  for(int i=0; i<numberOfPoints; i++){
    float x = random(0, width);
    float y = random(0, height);
   
    float dist = sqrt((400-x)*(400-x) + (400-y)*(400-y));
   
    if(dist < radius - 2){
       counter++;
       float size = random(7) + 1;
       ellipse(x, y, size, size);
    }
  }
 
  return counter;
}
