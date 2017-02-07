class Shelter extends Health
{
  PShape shelters;
  int w;
  int h;
  
  Shelter(int x,int y)
  {
    pos = new PVector(x,y);
    w = 60;
    h = 15;
  }
  
  void update()
  {
    fill(255);
    rect(pos.x,pos.y,w,h);
    
    if(w<=10)
    {
      shelter.remove(this);
    }
  }
}