class Oscillator {
  float theta;
  float speed;
  
  Oscillator (float _speed) {
    theta = 0.0;
    speed = _speed;
  }
  
  color blackWhiteOscillator () {
    theta += speed;
    return color(map(cos(theta), -1, 1, 210, 255));
  }
}
