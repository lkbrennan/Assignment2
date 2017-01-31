class Player
{ 
  PShape tank;
  
  void player()
  { 
    create();
  }
  
  void create()
  {
    tank = createShape();
    tank.beginShape();
    tank.stroke(255);
    tank.fill(255);
    tank.strokeWeight(1);
    tank.vertex(220,420);
    tank.vertex(240,420);
    tank.vertex(240,400);
    tank.vertex(260,400);
    tank.vertex(260,420);
    tank.vertex(280,420);
    tank.vertex(280,480);
    tank.vertex(220,480);
    tank.endShape(CLOSE);
  }
  
  void render()
  {
    
  }
  
  void update()
  {
    
  }
}