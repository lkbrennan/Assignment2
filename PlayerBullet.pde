class PlayerBullet
{
  PVector pos;
  PVector speed;
  
  //player bullet size set
  float size=20;
  
  //counters for timers set
  float timeToLive=5;
  float alive = 0;
  
  PlayerBullet()
  {
    pos = new PVector(player.pos.x,player.pos.y);
    speed = new PVector(0,3);
  }
  
  void render()
  {
    //creates bullet in a pushed matrix so you can just change the y coordinates
    pushMatrix();
    translate(pos.x, pos.y);
    strokeWeight(2);
    stroke(255);
    line(0, - size / 2, 0, size / 2);
    popMatrix();
  }
  
  void update()
  {
    pos.sub(speed);  
    
    //if playe bullet hits enemy, remove player bullet and decrease enemy lives
    //increase player score by 50
    for(int i=0; i<enemy.size();i++)
    {
      Enemies e = enemy.get(i);
      if((pos.x>=e.pos.x) && (pos.x<=e.pos.x+40))
      {
        if((pos.y>=e.pos.y) && (pos.y<=e.pos.y+20))
        {
          playerbullet.remove(this);
          e.lives--;
          player.score+=50;
        }
      }
    }
    
    //if the bullet hits a shelter, decreaseshelter width
    for(int i=0; i<shelter.size();i++)
    {
      Shelter s = shelter.get(i);
      if((pos.x>=s.pos.x) && (pos.x<=s.pos.x+s.w))
      {
        if((pos.y>=s.pos.y) && (pos.y<=s.pos.y+15))
        {
          playerbullet.remove(this);
          s.w -=10;
          s.pos.x+=5;
        }
      }
    }
    
    //if bullet hits master, master removed, bullet removed and player score increased
    for(int i =0;i<master.size();i++)
    {
      Master m = master.get(i);
      if((pos.x>=m.pos.x) && (pos.x<=m.pos.x+40))
      {
        if((pos.y>=m.pos.y) && (pos.y<=m.pos.y+20))
        {
          playerbullet.remove(this);
          m.lives--;
          player.score+=100;
        }
      }
    }
  }
}