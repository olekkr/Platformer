class Entity {

  float x;
  float y;
  int entityWidth = 20;
  int entityHeight = 50;
  Boolean collidable;
  float speedX = -15;
  float speedY = -10;
  boolean weight; //does it move due to gravity?
  color COLOR = unhex("a0AA0000");
  boolean onTheGround = false;
  int id = int(random(99))+100*gametick;

  Entity() {
  }

  void move(ArrayList<Obstacle> obstacles) { //move according to vel
    if (this.collidable) {
    }
    //this.x = this.x + this.speedX;
    //this.y = this.y + this.speedY;
    xMove();
  }

  void gravMove() {//move according to gravity
    if (this.weight) {
      if (onTheGround) {
        this.speedY = 0;
      }
      {
        this.speedY += gravConstant;
      }
    }
  }


  void render() {
    fill(COLOR);
    rect(x, y, this.entityWidth/1, this.entityHeight/1);
    fill(#00FF00);
    circle(x, y, 10);
  }

  void debug() {
    println("x:", this.x, "y:", this.y, 
      "entityWidth;", this.entityWidth, "entityHeight:", this.entityHeight, 
      "collidable:", this.collidable, "weight:", this.weight, 
      "speedXY:", this.speedX, this.speedY, gametick, 
      "id:", this.id);
  }

  void xMove() {
    if (this.collidable) { 
      float specX = this.x + this.speedX; //speculative x pos
      if (this.speedX < 0) {
        for(Obstacle obstacle : obstacles){
          if (testPInBox(specX, this.y, obstacle.x, obstacle.y, obstacle.width_, obstacle.height_)) {
            println("collided!");
            this.speedX = this.speedX * obstacle.bounceX * -1;
            specX = obstacle.x + obstacle.width_;
          }
          
          
          this.x = specX;
        }
        
      }
    }
  }
}
