class Master extends Health
{
  PVector speed;
  
  Master(int x,int y)
  {
    pos = new PVector(x,y);
    speed = new PVector(10,0);
    lives = 1;
  }
  
  void render()
  {
    image(mstr,pos.x,pos.y);
  }
  
  void update()
  {
    if(lives<=0)
    {
      master.remove(this);
    }
    
    pos.add(speed);
  }
}