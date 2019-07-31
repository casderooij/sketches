class Scribble {
  int x, y, r, points;
  int i = 0;
  ArrayList<PVector> scribbleArr;
  float a = random(0, TWO_PI);
  
  float xOff = 0.0;
  
  Scribble (int _x, int _y) {
    x = _x;
    y = _y;
    r = round(random(40, 140));
    points = round(random(8, 22));
    scribbleArr = new ArrayList<PVector>();
  }
  
  PVector createScribblePoint (int index) {
    int newR = r - i*4;
    if (index > points - 2) {
      newR = r - i * 5;
    }
    i++;
    return new PVector(cos(i * 0.2) * newR, sin(i * 1.2) * newR);
  }
  
  void display () {
    if (frameCount % 2 == 0 && i < points) {
      scribbleArr.add(createScribblePoint(i));
    }
    
    blendMode(MULTIPLY);
    noFill();
    stroke(255, 200, 20);
    strokeWeight(20);
    
    pushMatrix();
    translate(x, y);
    rotate(a);
    beginShape();
    for (PVector p : scribbleArr) {
      curveVertex(p.x, p.y);
    }
    endShape();
    popMatrix();
    
    if (keyPressed == true) {
      for (PVector p : scribbleArr) {
        p.lerp(newLocationPoint(p), 0.6);
      }
    }
  }
  
  PVector newLocationPoint (PVector p) {
    xOff = xOff + 0.1;
    float n = noise(xOff) * 20;
    println(n);
    PVector randomV = new PVector(random(-2.0, 2.0), random(-2.0, 2.0));
    return p.add(randomV);
  }
}
