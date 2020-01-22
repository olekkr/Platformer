class Entity {
  
  int x;
  int y;
  int entityWidth;
  int entityHeight;
  Boolean collision;
  int speedX;
  int speedY;
  
  
  Entity(){
    this.x = width/2;
    this.y = height/2;
    this.entityWidth = width/64;
    this.entityHeight = height/64;
    this.collision = false;
  
  }
  
}
