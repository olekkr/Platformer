class Entity {

  float x;
  float y;
  int entityWidth = 20;
  int entityHeight = 50;
  Boolean collidable;
  float speedX = 0;
  float speedY = 0;
  boolean weight; //does it move due to gravity?
  color COLOR = unhex("a0AA0000");
  boolean onTheGround = false;
  int id = int(random(99))+100*gametick;

  Entity() {
  }



  void gravMove() {//move according to gravity
    this.y = y + speedY;
    if (this.weight) {
      if (onTheGround) {
        this.speedY = 0;
      }
      else{
        
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
      "collision:", this.collidable, "weight:", this.weight, 
      "speedXY:", this.speedX, this.speedY, gametick, 
      "id:", this.id);
  }

  void move() {
    gravMove();
    xMove(); 
    //yMove();    
    if(this.speedX > maxSpeedX){
    this.speedX = maxSpeedX;
    }
    if(this.speedX > -maxSpeedX){
    this.speedX = -maxSpeedX;
    }
    
    if(this.speedY > maxSpeedY){
    this.speedY = maxSpeedY;
    }
  }

  void xMove() {
    float specX = this.x + this.speedX;
    if (this.collidable) {
      for (Obstacle obstacle : obstacles) {
        if (this.speedX < 0) {
          if (
          testPInBox(specX, this.y, obstacle.x, obstacle.y, obstacle.width_, obstacle.height_) || //if upper xy entity coor is in obstacle
          testPInBox(specX, this.y + this.entityHeight, obstacle.x, obstacle.y, obstacle.width_, obstacle.height_))  //if lower xy entity coor is in obstacle  if 
          //testPInBox(obstacle.x, obstacle)
          {
          {
            println("collided! x-");
            this.speedX = this.speedX * obstacle.bounceX * -1;
            this.x = obstacle.x + obstacle.width_;
          }
        }
        if (this.speedX > 0) {
        }
        if (testPInBox(specX + this.entityWidth, this.y, obstacle.x, obstacle.y, obstacle.width_, obstacle.height_)) {
          println("collided x+");
          println((obstacle.x + this.entityWidth));
          this.speedX = this.speedX * obstacle.bounceX * -1;

          this.x = obstacle.x - this.entityWidth;
        }
      }
    }
    this.x = specX;
  }
}
}
