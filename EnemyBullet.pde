class EnemyBullet extends Bullet
{
  EnemyBullet()
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
    if (alive > timeToLive)
    {
      playerbullet.remove(this);
    }   
  }
}