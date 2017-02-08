class Master extends Health
{
  //PVector holds speed
  PVector speed;
  
  Master(int x,int y)
  {
    pos = new PVector(x,y);
    speed = new PVector(10,0);
    lives = 1;
  }
  
  void render()
  {
    //sprite for master is PImage
    image(mstr,pos.x,pos.y);
  }
  
  void update()
  {
    //if master lives is less than or equal to zero, remove master from arraylist
    if(lives<=0)
    {
      master.remove(this);
    }
    
    pos.add(speed);
  }
}