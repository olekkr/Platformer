class Obstacle{
  float x;
  float y;
  float width_;
  float height_;
  int id; 
  color COLOR;
  float bounceX = 0.00;
  float bounceY = 0.00;
  
 Obstacle(int x, int y, int width_, int height_, int RED, int GREEN, int BLUE){//RGB mode
  id = int(random(999))+millis()*1000;
  this.x = x;
  this.y = y;
  this.width_ = width_;
  this.height_ = height_;
  this.COLOR = unhex("FF" + str(RED) + str(GREEN) + str(BLUE));
  println("obstacle color", hex(this.COLOR));
 }
 Obstacle(int x, int y, int width_, int height_){
  id = int(random(999))+millis()*1000;//posmode
  this.x = x;
  this.y = y;
  this.width_ = width_;
  this.height_ = height_;
  this.COLOR = #FF00FF;
  println("obstacle color", hex(this.COLOR));
 }
 Obstacle(int x, int y, int width_, int height_, color COLOR){//hexmode
   id = int(random(999))+millis()*1000;
  this.x = x;
  this.y = y;
  this.width_ = width_;
  this.height_ = height_;
  this.COLOR = COLOR;
  println("obstacle color", hex(this.COLOR));
 }
 void render(){
   fill(COLOR);
   rect(this.x/1,this.y/1,this.x+this.width_/1,this.y + this.height_/1);
 }
}
