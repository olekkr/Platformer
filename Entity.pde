class Entity {

  float x;
  float y;
  int entityWidth = 20;
  int entityHeight = 50;
  Boolean collidable;
  float speedX = -15;
  float speedY = -3;
  boolean weight; //does it move due to gravity?
  color COLOR = unhex("a0AA0000");
  boolean onTheGround = false;
  int id = int(random(99))+100*gametick;

  Entity() {
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
    //  println("x:", this.x, "y:", this.y, 
    //  "entityWidth;", this.entityWidth, "entityHeight:", this.entityHeight, 
    //  "collision:", this.collision, "weight:", this.weight, 
    //  "speedXY:", this.speedX, this.speedY, gametick,
    //  "id:", this.id);
  }

  void move() {
    gravMove();
    if (this.collidable) { 
      float specX = this.x + this.speedX; //speculative x pos
      float specY = this.y + this.speedX; //speculative y pos
      for (Obstacle obstacle : obstacles) {
        if (this.speedX < 0) {
          if (testPInBox(specX, this.y, obstacle.x, obstacle.y, obstacle.width_, obstacle.height_)) {
            println("collided!");
            this.speedX = this.speedX * obstacle.bounceX * -1;
            specX = obstacle.x + obstacle.width_;
            break;
          }
        }
        if (testPInBox(specX + this.entityWidth, this.y, obstacle.x, obstacle.y, obstacle.width_, obstacle.height_)) {
          println("collided!");
          this.speedX = this.speedX * obstacle.bounceX * -1;
          specX = obstacle.x - this.entityWidth;
          break;
        }
        //y collisions
        
        if (this.speedY < 0) {
          if (testPInBox(this.x, specY, obstacle.x, obstacle.y, obstacle.width_, obstacle.height_)) {
            println("collided!");
            this.speedY = this.speedY * obstacle.bounceY * -1;
            specY = obstacle.y + obstacle.height_;
            break;
          }
        }
        if (testPInBox(this.x + specY, this.y, obstacle.x, obstacle.y, obstacle.width_, obstacle.height_)) {
          println("collided!");
          this.speedY = this.speedY * obstacle.bounceY * -1;
          specY = obstacle.y - this.entityWidth;
          break;
        }
        this.y = specY;
        this.x = specX;
      }
    }
    
  
  }
}
