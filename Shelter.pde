class Shelter extends Health
{
  PShape shelters;
  
  Shelter(int x,int y)
  {
    pos = new PVector(x,y);
    create();
  }
  
  void create()
  {
    shelters = createShape();
    shelters.beginShape();
    shelters.stroke(255);
    shelters.fill(255);
    shelters.strokeWeight(1);
    shelters.vertex(0,15);
    shelters.vertex(60, 15);
    shelters.vertex(60,0);
    shelters.vertex(0,0);
    shelters.endShape(CLOSE);
  }
  
  void update()
  {
    shape(shelters,pos.x,pos.y); 
    //if(health
  }
}