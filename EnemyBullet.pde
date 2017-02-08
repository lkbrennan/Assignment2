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
    pos.add(speed);
    
    if((pos.x>=player.pos.x-25) && (pos.x<=(player.pos.x+25)))
    {
      if((pos.y>=player.pos.y) && (pos.y<=(player.pos.y+20)))
      {
        enemybullet.remove(this);
        player.lives-=1;
      }
    }
    for(int i=0; i<shelter.size();i++)
    {
      Shelter s = shelter.get(i);
      if((pos.x>=s.pos.x) && (pos.x<=s.pos.x+s.w))
      {
        if((pos.y>=s.pos.y) && (pos.y<=s.pos.y+15))
        {
          enemybullet.remove(this);
          s.w -=10;
          s.pos.x+=5;
        }
      }
    }
    if(pos.y>=450)
    {
      enemybullet.remove(this);
    }
  }
}