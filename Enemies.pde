class Enemies extends Health
{
  //PImage alien;
  PVector fly;
  PVector drop;
  PVector original;

  //PShape enemies;
  float alive=0;

  Enemies(int x, int y)
  {
    original = new PVector(x, y);
    pos = new PVector(x, y);
    fly = new PVector(10, 0);
    drop = new PVector(0, 30);
    lives = 1;
    //alien = loadImage("sprite.png");
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
  }
}