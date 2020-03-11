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
  float dynamicDecelR = 0;

  Entity(float xpos, float ypos, boolean weight) {
    this.x = xpos;
    this.y = ypos;
    this.weight = weight;
  }
  Entity() {
    this.x = width/2-entityWidth/2+400;
    this.y = height/2;
    this.entityWidth = 33;
    this.entityHeight = 64;
    this.collidable = true;
    this.weight = true;
    this.onTheGround = false;
  }

  void decelX() {
    this.speedX = this.speedX * decelerationK;
    if(onTheGround){
      this.speedX -= this.speedX * dynamicDecelR;
    }
    if (abs(this.speedX) < maxSpeedX/4) {
      this.speedX = this.speedX * decelerationK2;
    } 
    if (abs(this.speedX) < 0.05) {
      this.speedX = 0;
    }
  }

  void gravMove() {//move according to gravity
    //this.y = y + speedY;
    if (this.weight) {
      if (onTheGround) {
        this.speedY = 0;
      } else {
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
    yMove(); 
    //decelX();



    if (this.speedX > maxSpeedX) {
      this.speedX = maxSpeedX;
    }
    if (this.speedX < -maxSpeedX) {
      this.speedX = -maxSpeedX;
    }

    if (this.speedY > maxSpeedY) {
      this.speedY = maxSpeedY;
    }

    if (this.speedY < -maxSpeedY) {
      this.speedY = -maxSpeedY;
    }
  }

  void xMove() {
    float specX = this.x + this.speedX;
    if (this.collidable) {
      for (Obstacle obstacle : obstacles) {
        if (this.speedX < 0) {
          if (
            (testPInBox(specX, this.y, obstacle.x, obstacle.y, obstacle.width_, obstacle.height_) || //if upper xy entity coor is in obstacle
            testPInBox(specX, this.y + this.entityHeight, obstacle.x, obstacle.y, obstacle.width_, obstacle.height_)) || //if lower xy entity coor is in obstacle  if 
            (testPInBox(obstacle.x, obstacle.y, this.x, this.y, this.entityWidth, this.entityHeight)) ||
            testPInBox(obstacle.x, obstacle.y + obstacle.height_, this.x, this.y, this.entityWidth, this.entityHeight)) {
            {
              println("collided! x-" + str(this.speedX * obstacle.bounceX * -1));
              this.speedX = this.speedX * obstacle.bounceX * -1;
              specX = obstacle.x + obstacle.width_;
            }
          }
        } else if (this.speedX > 0) {
          if (
            testPInBox(specX + this.entityWidth, this.y, obstacle.x, obstacle.y, obstacle.width_, obstacle.height_) || //if upper xy entity coor is in obstacle
            testPInBox(specX + this.entityWidth, this.y + this.entityHeight, obstacle.x, obstacle.y, obstacle.width_, obstacle.height_) || //if lower xy entity coor is in obstacle  if 
            testPInBox(obstacle.x, obstacle.y, specX, this.y, this.entityWidth, this.entityHeight) ||
            testPInBox(obstacle.x, obstacle.y + obstacle.height_, specX, this.y, this.entityWidth, this.entityHeight)) {
            println("collided x+");
            println("SPEED:", this.speedX );
            this.speedX = this.speedX * obstacle.bounceX * -1;

            specX = obstacle.x - this.entityWidth;
          }
        }
      }
      this.x = specX;
    }
  }


  void yMove() {
    float specY = this.y + this.speedY;
    if (this.collidable) {
      for (Obstacle obstacle : obstacles) {
        if (this.speedY < 0) {
          if (
            testPInBox(this.x, specY, obstacle.x, obstacle.y, obstacle.width_, obstacle.height_) || //if upper xy entity coor is in obstacle
            testPInBox(this.x + this.entityWidth, specY + this.entityHeight, obstacle.x, obstacle.y, obstacle.width_, obstacle.height_) || //if lower xy entity coor is in obstacle  if 
            testPInBox(obstacle.x, obstacle.y, this.x, specY, this.entityWidth, this.entityHeight) ||
            testPInBox(obstacle.x, obstacle.y + obstacle.height_, this.x, specY, this.entityWidth, this.entityHeight)) {

            println("collided! y-" + str(this.speedY * obstacle.bounceY * -1));
            this.speedY = this.speedY * obstacle.bounceY * -1;
            specY = obstacle.y + obstacle.height_;
            this.onTheGround = true;
          }
          else {
              this.onTheGround = false;
            }
        } else if (this.speedY > 0) {
          if (
            testPInBox(this.x, specY + this.entityHeight, obstacle.x, obstacle.y, obstacle.width_, obstacle.height_) || //if upper xy entity coor is in obstacle
            testPInBox(this.x + this.entityWidth, specY + this.entityHeight, obstacle.x, obstacle.y, obstacle.width_, obstacle.height_) || //if lower xy entity coor is in obstacle  if 
            testPInBox(obstacle.x, obstacle.y, this.x, specY, this.entityWidth, this.entityHeight) ||
            testPInBox(obstacle.x, obstacle.y + obstacle.height_, specY, this.y, this.entityWidth, this.entityHeight)) {
            println("collided y+");
            println("SPEED:", this.speedX );
            this.speedY = this.speedX * obstacle.bounceX * -1;
            this.landingEvent(obstacle);
            specY = obstacle.y - this.entityHeight;
          }
        }
      }
      this.y = specY;
    }
  }
  void landingEvent(Obstacle obstacle){
    this.dynamicDecelR = obstacle.decelR;
  }
}
