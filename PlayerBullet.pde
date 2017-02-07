class PlayerBullet
{
  PVector pos;
  PVector speed;
  
  float size=20;
  float timeToLive=5;
  float alive = 0;
  
  PlayerBullet()
  {
    pos = new PVector(player.pos.x,player.pos.y);
    speed = new PVector(0,3);
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    strokeWeight(2);
    stroke(255);
    line(0, - size / 2, 0, size / 2);
    popMatrix();
  }
  
  void update()
  {
    alive += timeDelta;
    pos.sub(speed);
    if (alive > timeToLive)
    {
      playerbullet.remove(this);
    }   
    
    for(int i=0; i<enemy.size();i++)
    {
      Enemies e = enemy.get(i);
      if((pos.x>=e.pos.x) && (pos.x<=e.pos.x+40))
      {
        if((pos.y>=e.pos.y) && (pos.y<=e.pos.y+20))
        {
          playerbullet.remove(this);
          e.lives--;
        }
      }
    }
    
    for(int i=0; i<shelter.size();i++)
    {
      Shelter s = shelter.get(i);
      if((pos.x>=s.pos.x) && (pos.x<=s.pos.x+60))
      {
        if((pos.y>=s.pos.y) && (pos.y<=s.pos.y+15))
        {
          playerbullet.remove(this);
          s.w -=10;
          s.pos.x+=5;
        }
      }
    }
  }
}