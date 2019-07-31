class Scribble {
  int x, y, r, points;
  int i = 0;
  ArrayList<PVector> scribbleArr;
  float a = random(0, TWO_PI);
  
  float randA = random(1.1, 2.0);
  float randB = random(1.1, 2.0);
  
  Scribble (int _x, int _y) {
    x = _x;
    y = _y;
    r = round(random(40, 80));
    //points = round(random(8, 12));
    points = 10;
    scribbleArr = new ArrayList<PVector>();
  }
  
  PVector createScribblePoint (int index) {
    int newR = r - i*4;
    if (index > points - 2) {
      newR = r - i * 5;
    }
    i++;
    return new PVector(cos(i * randA) * newR, sin(i * randB) * newR);
  }
  
  void display () {
    if (frameCount % 2 == 0 && i < points) {
      scribbleArr.add(createScribblePoint(i));
    }
    
    blendMode(MULTIPLY);
    noFill();
    stroke(255, 154, 0);
    strokeWeight(10);
    
    pushMatrix();
    translate(x, y);
    rotate(a);
    beginShape();
    for (PVector p : scribbleArr) {
      curveVertex(p.x, p.y);
    }
    endShape();
    popMatrix();
    
    for (PVector p : scribbleArr) {
      p.lerp(newLocationPoint(p), 0.1);
    }
  }
}

PVector newLocationPoint (PVector p) {
  PVector randomV = new PVector(random(-2.0, 2.0), random(-2.0, 2.0));
  return p.add(randomV);
}
