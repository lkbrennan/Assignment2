class Booster extends Health
{
  int alive;
  
  //booster class for extra lives
  Booster(int x, int y)
  {
    pos = new PVector(x, y);
    alive=0;
  }

  void render()
  {
    //uses PImage of heart
    image(life, pos.x, pos.y);
  }

  void update()
  {
    //counter to keep booster there for 5 seconds max
    alive+=frameCount;
    
    //checks if player has collided with heart
    if ((player.pos.x>=pos.x)&&(player.pos.x<=(pos.x+20)))
    {
      if (player.lives<3)
      {
        //increases player lives
        player.lives++;
      }
      //removes booster from arraylist
      booster.remove(this);
    }
    
    //removes booster from arraylist if timer is over 5 seconds
    if(alive==300)
    {
      booster.remove(this);
    }
  }
}