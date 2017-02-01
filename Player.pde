class Player extends Health
{ 
  int x,y;
  PShape tank;
  
  Player()
  { 
    this.x=0;
    this.y=0;
    create();
  }
  
  void create()
  {
    tank = createShape();
    tank.beginShape();
    tank.stroke(255);
    tank.fill(255);
    tank.strokeWeight(1);
    tank.vertex(x-25,y-10);
    tank.vertex(x-5,y-10);
    tank.vertex(x-5,y-20);
    tank.vertex(x+5,y-20);
    tank.vertex(x+5,y-10);
    tank.vertex(x+25,y-10);
    tank.vertex(x+25,y+10);
    tank.vertex(x-25,y+10);
    tank.endShape(CLOSE);
  }
  
  void update(int playerx)
  {
    shape(tank,playerx,450);
  }
}