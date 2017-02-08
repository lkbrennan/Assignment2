class Shelter extends Health
{
  //shelters created with PShape
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
    
    //remove shelter if width is less than 5
    if(w<=5)
    {
      shelter.remove(this);
    }
  }
}