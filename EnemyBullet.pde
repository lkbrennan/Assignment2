class EnemyBullet 
{
  PVector pos;
  PVector speed;
  
  float size=20;
  float timeToLive=5;
  float alive = 0;
  
  EnemyBullet(PVector origin)
  {
    pos = new PVector(origin.x,origin.y);
    speed = new PVector(0,3);
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(255);
    strokeWeight(2);
    line(0, - size / 2, 0, size / 2);
    popMatrix();
  }
  
  void update()
  {
    alive+=timeDelta; 
    pos.add(speed);
    /*if(alive > timeToLive)
   ive)
    {
      playerbullet.remove(this);
    }  */ 
  }
}