class Coin extends Entity {
  float turnRate;
  int m_x, m_y;
  int radius= 50;

  Coin(int x, int y) {
    turnRate = 50;
    this.m_x = x;
    this.m_y = y;
  }
  Coin() {
    turnRate = 1/50;
    this.m_x = 50;
    this.m_y = 50;
  }


  void render() {
    fill(unhex("FFFFEA00"));
    ellipse(m_x, m_y, radius * sin(frameCount * PI * 1/turnRate), radius);
    
  }
  
  boolean contains(int x, int y){
   return sqrt(sq(x-this.m_x) + sq(y-this.m_y)) < this.radius;
   
  }
}
