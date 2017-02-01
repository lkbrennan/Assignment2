class Shelter
{
  PShape shelter;
  int posx,posy;
  
  Shelter(int x, int y)
  {
    this.posx=x;
    this.posy=y;
    
    create();
  }
  
  void create()
  {
    shelter = createShape();
    shelter.beginShape();
    shelter.stroke(255);
    shelter.fill(255);
    shelter.strokeWeight(1);
    shelter.vertex(posx,posy);
    shelter.vertex(posx+60, posy);
    shelter.vertex(posx+60,posy-15);
    shelter.vertex(posx,posy-15);
    shelter.endShape(CLOSE);
    
  }
  
  void update()
  {
    
  }
}