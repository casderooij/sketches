PImage plant;
PVector errRGB;

void setup () {
  size(500, 500);
  noCursor();
  plant = loadImage("plant.jpeg");
}

int index (int x, int y) {
  return x + y * width;
}

void draw () {
  background(255);
  
  image(plant, -50, 100, 600, 600);
  
  noStroke();
  
  fill(80, 100, 120, 100);
  ellipse(mouseX, mouseY, 80, 80);
  
  fill(100, 100, 120, 100);
  ellipse(200, 160, 130, 130);
  
  filter(GRAY);
  
  fill(200, 200, 120, 100);
  ellipse(400, 100, 180, 180);
  
  fill(0, 200, 0, 100);
  ellipse(200, 300, 20, 20);
  
  
  newDither();
}

void newDither () {
  loadPixels();
  for (int y = 0; y < height - 1; y++) {
    for (int x = 1; x < width - 1; x++) {
      color pix = pixels[index(x, y)];
      PVector oldRGB = new PVector(red(pix), green(pix), blue(pix));
      float factor = 1;
      PVector newRGB = new PVector(
        round(factor * oldRGB.x / 255) * (255/factor),
        round(factor * oldRGB.y / 255) * (255/factor),
        round(factor * oldRGB.z / 255) * (255/factor)
      );
      pixels[index(x, y)] = color(newRGB.x, newRGB.y, newRGB.z);

      errRGB = new PVector(
        oldRGB.x - newRGB.x,
        oldRGB.y - newRGB.y,
        oldRGB.z - newRGB.z
      );
      
      setPixel(x+1, y, 7);
      setPixel(x-1, y+1, 3);
      setPixel(x, y+1, 5);
      setPixel(x+1, y+1, 1);
    }
  }
  updatePixels(); 
}

void setPixel (int _x, int _y, int part) {
  int index = index(_x, _y);
  color c = pixels[index];
  float r = red(c);
  float g = green(c);
  float b = blue(c);
  r = r + errRGB.x * part / 16.0;
  g = g + errRGB.y * part / 16.0;
  b = b + errRGB.z * part / 16.0;
  pixels[index] = color(r, g, b);
}
