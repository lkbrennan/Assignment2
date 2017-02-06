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
    enemies.vertex(-20,-10);
    enemies.vertex(20,-10);
    enemies.vertex(0,101);
    enemies.endShape(CLOSE);
  }
  
  void update()
  {
    //if(alive%10==0)
    //{
      if(counter%2==0)
      {
        pos.sub(fly);
      }
      else
      {
        pos.add(fly);
      }
    //}
    shape(enemies, pos.x, pos.y);;
  }
}