class Player
{ 
  int x;
  PShape tank;
  
  void player()
  { 
    this.x=220;
    create();
  }
  
  void create()
  {
    tank = createShape();
    tank.beginShape();
    tank.stroke(255);
    tank.fill(255);
    tank.strokeWeight(1);
    tank.vertex(x,420);
    tank.vertex(x+20,420);
    tank.vertex(x+20,400);
    tank.vertex(x+40,400);
    tank.vertex(x+40,420);
    tank.vertex(x+60,420);
    tank.vertex(x+60,480);
    tank.vertex(x,480);
    tank.endShape(CLOSE);
  }
  
  void update()
  {
    
  }
}