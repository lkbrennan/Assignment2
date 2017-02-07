class PlayerBullet
{
  PVector pos;
  PVector speed;
  
  float size=30;
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
  }
}