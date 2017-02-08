class Enemies extends Health
{
  //PVectors that control the ship moving acroos and down the screen
  PVector fly;
  PVector drop;


  Enemies(int x, int y)
  {
    pos = new PVector(x, y);
    fly = new PVector(10, 0);
    drop = new PVector(0, 30);
    //setting enemy lives to 1
    lives = 1;
  }
   
   void render()
   {
     //Using PImage for enemy sprites
     image(alien, pos.x, pos.y);
   }

  void update()
  {
    //counter is increased in main methos and if its evenly divided by 2 then it moves an alternate direction
    if (counter%2==0)
    {
      pos.sub(fly);
    } 
    else
    {
      pos.add(fly);
    }
    
    //removes enemy from arraylist if lives are less than zero
    if(lives<=0)
    {
      enemy.remove(this);
    }
    
    //if enemies hit the ground, player dies
    if(pos.y>=400)
    {
      player.lives=0;
    }
  }
}