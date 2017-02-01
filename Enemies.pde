class Enemies
{
  PShape enemies;
  
  Enemies()
  {
     create(); 
  }
  
  void create()
  {
    enemies = createShape();
    enemies.beginShape();
    enemies.stroke(255);
    enemies.fill(255);
    enemies.vertex(-15,-15)
    enemies.vertex(15,-15);
    enemies.vertex(0,15);
    enemies.endShape(CLOSE);
  }
  
  void update()
  {
   
  }
}