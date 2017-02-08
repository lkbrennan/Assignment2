class EnemyBullet 
{
  PVector pos;
  PVector speed;
  
  //setting size of bullets
  float size=20;
  
  EnemyBullet(PVector origin)
  {
    //creating speed and position for enemy bullets
    pos = new PVector(origin.x,origin.y);
    speed = new PVector(0,3);
  }
  
  void render()
  {
    //creates bullet in a pushed matrix so you can just change the y coordinates
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(255);
    strokeWeight(2);
    line(0, - size / 2, 0, size / 2);
    popMatrix();
  }
  
  void update()
  {
    //add speed to position
    pos.add(speed);
    
    
    //if enemy bullet collides with player, player lives decremented and bullet deleted
    if((pos.x>=player.pos.x-25) && (pos.x<=(player.pos.x+25)))
    {
      if((pos.y>=player.pos.y) && (pos.y<=(player.pos.y+20)))
      {
        enemybullet.remove(this);
        player.lives-=1;
      }
    }
    
    //if enemy bullet hits shelter, shelter width decreases and bullet disappears
    for(int i=0; i<shelter.size();i++)
    {
      Shelter s = shelter.get(i);
      if((pos.x>=s.pos.x) && (pos.x<=s.pos.x+s.w))
      {
        if((pos.y>=s.pos.y) && (pos.y<=s.pos.y+15))
        {
          enemybullet.remove(this);
          s.w -=10;
          s.pos.x+=5;
        }
      }
    }
    
    //delete bullet if it hits ground
    if(pos.y>=450)
    {
      enemybullet.remove(this);
    }
  }
}