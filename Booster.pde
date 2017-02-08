class Booster extends Health
{
  int alive;
  
  Booster(int x, int y)
  {
    pos = new PVector(x, y);
    lives=1;
    alive=0;
  }

  void render()
  {
    image(life, pos.x, pos.y);
  }

  void update()
  {
    alive+=frameCount;
    if ((player.pos.x>=pos.x)&&(player.pos.x<=(pos.x+20)))
    {
      if (player.lives<3)
      {
        player.lives++;
      }
      booster.remove(this);
    }
    if(alive==300)
    {
      booster.remove(this);
    }
  }
}