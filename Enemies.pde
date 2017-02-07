class Enemies extends Health
{
  PVector fly;
  PVector drop;

  float alive=0;

  Enemies(int x, int y)
  {
    pos = new PVector(x, y);
    fly = new PVector(10, 0);
    drop = new PVector(0, 30);
    lives = 1;
  }
   
   void render()
   {
     image(alien, pos.x, pos.y);
   }

  void update()
  {
    if (counter%2==0)
    {
      pos.sub(fly);
    } 
    else
    {
      pos.add(fly);
    }
    if(lives<=0)
    {
      enemy.remove(this);
    }
    if(pos.y>=400)
    {
      player.lives=0;
    }
  }
}