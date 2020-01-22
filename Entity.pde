class Entity {
  
  int x;
  int y;
  int entityWidth;
  int entityHeight;
  Boolean collision;
  float speedX;
  float speedY;
  boolean weight; //does it move due to gravity?

  void move(){ //move in according to vel
    this.x = int(this.x + this.speedX);
    this.y = int(this.y + this.speedY);
  }
  
  void gravMove(){//move according to gravity
    if(weight){
      this.speedY += 0.1;
    }
  }
  
  
  Entity(){
    this.x = width/2;
    this.y = height/2;
    this.entityWidth = width/64;
    this.entityHeight = height/64;
    this.collision = false;
    this.weight = true;
  }
  
}
