class Coin extends Entity {
  float turnRate;
  int m_x, m_y;

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
    ellipse(50, 50, 50 * sin(frameCount * PI * 1/turnRate), 50);
    
  }
}
