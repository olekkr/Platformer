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
  
  void move() { //move in according to vel
    this.x = int(this.x + this.speedX);
    this.y = int(this.y + this.speedY);
  }

  void gravMove() {//move according to gravity
    if (weight) {
      this.speedY += 0.1;
    }
  }
  
  void render(){
    fill(COLOR[0], COLOR[1], COLOR[2]);
    rect(x, y, x + this.entityWidth/1, y + this.entityHeight/1);
  }


  Entity() {
    this.x = width/2;
    this.y = height/2;
    this.entityWidth = width/64;
    this.entityHeight = height/64;
    this.collision = false;
    this.weight = true;
  }
}
