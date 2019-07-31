PVector errRGB;
ArrayList<Oscillator> osc;

void setup () {
  size(500, 500);
  noCursor();
  
  osc = new ArrayList<Oscillator>();
}

int index (int x, int y) {
  return x + y * width;
}

void draw () {
  background(250);
  
  noStroke();
  
  fill(219, 173, 119, 100);
  ellipse(120, 300, 200, 200);
  
  fill(130);
  ellipse(200, 140, 120, 120);
  
  stroke(223, 213, 165);
  strokeWeight(10);
  line(400, 120, 350, 300);
  stroke(200, 0, 0, 100);
  line(420, 170, 300, 350);
  stroke(80);
  line(40, 410, 390, 430);
  
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
