class Player extends Health
{
  PShape tank;
  color c;
  int score;
  
  Player()
  { 
    score=0;
    c=color(255);
    lives = 3;
    pos = new PVector(220,450);
    create();
  }
  
  void create()
  {
    tank = createShape();
    tank.beginShape();
    tank.fill(c);
    tank.stroke(c);
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
    println(lives);
  }
  
  void hurt()
  {
    c=color(255,0,0);
  }
}