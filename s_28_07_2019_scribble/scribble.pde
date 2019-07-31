class Scribble {
  int x, y, r, points;
  int i = 0;
  ArrayList<PVector> scribbleArr;
  
  Scribble (int _x, int _y) {
    x = _x;
    y = _y;
    r = round(random(40, 140));
    points = round(random(8, 12));
    scribbleArr = new ArrayList<PVector>();
  }
  
  PVector createScribblePoint (int index) {
    int newR = r - i;
    if (index > points - 2) {
      newR = r - i * 5;
    }
    i++;
    return new PVector(cos(i) * newR, sin(i) * newR);
  }
  
  void display () {
    if (frameCount % 2 == 0 && i < points) {
      scribbleArr.add(createScribblePoint(i));
    }
    
    blendMode(MULTIPLY);
    noFill();
    stroke(255, 154, 0);
    strokeWeight(12);
    
    pushMatrix();
    translate(x, y);
    beginShape();
    for (PVector p : scribbleArr) {
      curveVertex(p.x, p.y);
    }
    endShape();
    popMatrix();
  }
}
