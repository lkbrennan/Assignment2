class Booster extends Health
{
  Booster(int x, int y)
  {
    pos = new PVector(x, y);
    lives=1;
  }

  void render()
  {
    image(life, pos.x, pos.y);
  }

  void update()
  {
    if ((player.pos.x>=pos.x)&&(player.pos.x<=(pos.x+20)))
    {
      if (player.lives<3)
      {
        player.lives++;
      }
      booster.remove(this);
    }
  }
}