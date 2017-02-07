class Player extends Health
{
  PShape tank;
  
  Player()
  { 
    pos = new PVector(220,450);
    create();
  }
  
  void create()
  {
    tank = createShape();
    tank.beginShape();
    tank.stroke(255);
    tank.fill(255);
    tank.strokeWeight(1);
    tank.vertex(-25,-10);
    tank.vertex(-5,-10);
    tank.vertex(-5,-20);
    tank.vertex(5,-20);
    tank.vertex(5,-10);
    tank.vertex(25,-10);
    tank.vertex(25,10);
    tank.vertex(-25,10);
    tank.endShape(CLOSE);
  }
  
  void update()
  {
    shape(tank,pos.x,pos.y);
  }
}