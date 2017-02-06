/*Assignment 2
Student Name: Lauren Keenan Brennan
Student Number: C15434102
Date: 6/2/2017
*/

/*
TO DO
1. create enemies
2. create bullet
3. Health
4. scores
5. file saving and reading
6. how to play screen
7. power ups maybe?
*/


PFont NameFont;
PFont OptionFont;
PFont ExplainFont;

Player player;

ArrayList<Shelter> shelter;
ArrayList<Enemies> enemy;
ArrayList<Bullet> bullet;

void setup()
{
  size(500,500);
  noCursor();
  
  NameFont = createFont("AR DESTINE",55);
  OptionFont = createFont("AR DESTINE",35);
  ExplainFont = createFont("AR DESTINE", 32);
  
  player = new Player();
  shelter = new ArrayList<Shelter>();
  enemy= new ArrayList<Enemies>();
  bullet = new ArrayList<Bullet>();
  
  for(int i=0;i<4;i++)
  {
    Shelter s = new Shelter();
    shelter.add(s);
  }
  
  for(int i=0;i<16;i++)
  {
    for(int x =20;x<=240;x+=60)
    {
      for(int y = 10;y<90;y+=30)
      {
        Enemies enemies=new Enemies(x,y);
        enemy.add(enemies);
      }
    }
  }
}

int userMenu = 0;

int counter = 1;

int[] shelterx = {50,170,290,410};

float timeDelta = 1.0f/60.0f;

void draw()
{
  background(0);
  
  if(userMenu == 0)
  {
    displayMenu();
  }
  else
  {
    switch(userMenu)
    {
      case 1:
        player.update();
        for(int i=0;i<shelter.size();i++)
        {
          Shelter s = shelter.get(i);
          s.update(shelterx[i],400);
        }
        
        for(int i=0;i<enemy.size();i++)
        {
          Enemies e = enemy.get(i);
          e.update();
          
          if(e.pos.x>=460)
          {
            for(Enemies ship: enemy)
            {
              ship.pos.add(ship.drop);
            } 
            counter++;
          }
          
        }
        break;
      case 2:
        //seeScores();
        break;
      case 3:
        howtoplay();
        break;
    } //end switch */
  }//end else
  println(userMenu);
}

void displayMenu()
{
  background(0);
  textFont(NameFont);
  fill(255);
  textAlign(CENTER);
  text("SPACE INVADERS", 250,100);
  textFont(OptionFont);
  fill(255);
  textAlign(CENTER);
  text("1. Play Game", 250,200);
  text("2. See Scores", 250,300);
  text("3. How to Play", 250,400);
}

void howtoplay()
{
  background(0);
  textFont(ExplainFont);
  fill(255);
  textAlign(CENTER);
  text("The aim of the game is to\nstop the aliens landing!!\nAvoid their bullets and\nshoot them back.\nTo move your tank, hit the\nw,a,s and d keys or else\nuse the arrows on\nyour keyboard.", 250,50);
  text("Press b for Main Screen",250,450);
  if(userMenu==0)
  {
    displayMenu();
  }
}

/*void seeScores()
{
  
  if(userMenu==0)
  {
    displayMenu();
  }
}*/

void keyPressed()
{
  if(key != CODED)
  {
    if(key == '1')
    {
      userMenu = 1;
    }
    if(key == '2')
    {
      userMenu = 2;
    }
    if(key == '3')
    {
      userMenu = 3;
    }
    if(key == 'b')
    {
      userMenu = 0;
    }
    if(key == 'a')
    {
      if(player.pos.x > 20)
      {
        player.pos.sub(10,0);
      }
    }
    if(key == 'd')
    {
      if(player.pos.x < width-20)
      {
        player.pos.add(10,0);
      }
    }
    if(key == 'w')
    {
      bullet.add(new PlayerBullet());
    }
  }
  if(key == CODED)
  {
    if(keyCode == LEFT)
    {
      if(player.pos.x > 20)
      {
        player.pos.sub(10,0);
      }
    }
    if(keyCode == RIGHT)
    {
      if(player.pos.x < width-20)
      {
        player.pos.add(10,0);
      }
    }
  }
}//end key checking