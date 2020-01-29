class Entity {

  int x;
  int y;
  int entityWidth = 20;
  int entityHeight = 50;
  Boolean collision;
  float speedX = -5;
  float speedY = -5;
  boolean weight; //does it move due to gravity?
  color COLOR = unhex("a0AA0000");
  boolean onTheGround = false;
  int id = int(random(99))+100*gametick;
  
  Entity() {
    this.x = width/2-entityWidth/2+400;
    this.y = height/2;
    this.entityWidth = 64;
    this.entityHeight = 50;
    this.collision = false;
    this.weight = true;
  }

  void move(ArrayList<Obstacle> obstacles) { //move according to vel
    if (this.collision) {
    }
    this.x = int(this.x + this.speedX);
    this.y = int(this.y + this.speedY);
  }

  void gravMove() {//move according to gravity
    if (this.weight) {
      if (onTheGround) {
        this.speedY = 0; 
      }
      {
        this.speedY += 0.19;
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
    "collision:", this.collision, "weight:", this.weight, 
    "speedXY:", this.speedX, this.speedY, gametick,
    "id:", this.id);
  }

  boolean testCollision(Obstacle obstacle) {
    if (this.collision) { 
      if (
        obstacle.testCollision(this.x + int(speedX), this.y + int(speedY)) || 
        obstacle.testCollision(this.x + int(speedX), this.y + this.entityHeight + int(speedY)) || 
        obstacle.testCollision(this.x + this.entityWidth + int(speedX), this.y + int(speedY)) || 
        obstacle.testCollision(this.x + this.entityWidth + int(speedX), this.y - this.entityHeight + int(speedY)) 
        ) {
        println("collided__________________________________________________");
        return true;
      }
    }
    return false;
  }
}
