class Enemies
{
  PVector pos;
  PVector fly;
  PVector drop;
  
  PShape enemies;
  float alive=0;
  
  Enemies(int x,int y)
  {
     pos = new PVector(x,y);
     fly = new PVector(20,0);
     drop = new PVector(0,30);
     
     create(); 
  }
  
  void create()
  {
    enemies = createShape();
    enemies.beginShape();
    enemies.stroke(255);
    enemies.fill(255);
    enemies.vertex(-15,-15);
    enemies.vertex(15,-15);
    enemies.vertex(0,15);
    enemies.endShape(CLOSE);
  }
  
  void update()
  {
    alive+=timeDelta;
    if(alive%10==0)
    {
      if(counter%2==0)
      {
        pos.add(fly);
      }
      else
      {
        pos.sub(fly);
      }
    }
    shape(enemies, pos.x, pos.y);;
  }
}