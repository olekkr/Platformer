class Entity {

  int x;
  int y;
  int entityWidth = 20;
  int entityHeight = 50;
  Boolean collision;
  float speedX;
  float speedY;
  boolean weight; //does it move due to gravity?
  int[] COLOR = {0,0,255};
  
  Entity() {
    this.x = width/2;
    this.y = height/2;
    this.entityWidth = 64;
    this.entityHeight = 500;
    this.collision = false;
    this.weight = true;
  }
  
  void move() { //move in according to vel
    this.x = int(this.x + this.speedX);
    this.y = int(this.y + this.speedY);
  }

  void gravMove() {//move according to gravity
    if (weight) {
      this.speedY += 0.2;
    }
  }
  
  void render(){
    fill(COLOR[0], COLOR[1], COLOR[2]);
    rect(x, y, x + this.entityWidth/1, y + this.entityHeight/1);
  }

  void debug(){
  println("x:", this.x, "y:", this.y, "entityWidth;", this.entityWidth, "entityHeight:", this.entityHeight, "collision:", this.collision, "speedXY:", this.speedX, this.speedY);
  }
  
  
  
}
