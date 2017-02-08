/*Assignment 2
 Student Name: Lauren Keenan Brennan
 Student Number: C15434102
 Date: 6/2/2017
 */

/*
TO DO
 5. file saving and reading
 7. power ups maybe? Lives
 */
PImage alien;
PImage mstr;

PFont NameFont;
PFont OptionFont;
PFont ExplainFont;
PFont GameFont;

Player player;

ArrayList<Shelter> shelter;
ArrayList<Enemies> enemy;
ArrayList<PlayerBullet> playerbullet;
ArrayList<EnemyBullet> enemybullet;
ArrayList<Master> master;

void setup()
{
  size(500, 500);
  noCursor();

  alien = loadImage("sprite.png");
  mstr = loadImage("master.png");

  NameFont = createFont("AR DESTINE", 55);
  OptionFont = createFont("AR DESTINE", 35);
  ExplainFont = createFont("AR DESTINE", 32);
  GameFont = createFont("AR DESTINE", 25);

  player = new Player();
  shelter = new ArrayList<Shelter>();
  enemy= new ArrayList<Enemies>();
  playerbullet = new ArrayList<PlayerBullet>();
  enemybullet = new ArrayList<EnemyBullet>();
  master = new ArrayList<Master>();

  for (int i=0; i<4; i++)
  {
    Shelter s = new Shelter(shelterx[i], 400);
    shelter.add(s);
  }

  for (int y = 40; y<=130; y+=30)
  {
    for (int x =40; x<=240; x+=60)
    {
      enemy.add(new Enemies(x, y));
    }
  }
}

int userMenu = 0;

int counter = 1;
int s = 30;

int[] shelterx = {50, 170, 290, 410};

float timeDelta = 1.0f / 60.0f;

boolean motion = true;

int enemyfire;

void draw()
{
  background(0);

  enemyfire = ((int)random(0, enemy.size()));
  if (userMenu == 0)
  {
    displayMenu();
  } else
  {
    switch(userMenu)
    {
    case 1:
      player.update();

      textFont(GameFont);
      fill(25, 247, 10);
      textAlign(CENTER);
      text("LIVES:"+player.lives, 100, 480);
      text("SCORE:"+player.score, 400, 480);

      for (int i=0; i<shelter.size(); i++)
      {
        Shelter s = shelter.get(i);
        s.update();
      } 
      
      if(frameCount%420==0)
      {
        master.add(new Master(0,10));
      }
      
      for(int i=0;i<master.size();i++)
      {
        Master m = master.get(i);
        if(frameCount%5==0)
        {
          m.update();
        }
        m.render();
      }
      
      for (int i=0; i<enemy.size(); i++)
      {
        Enemies e = enemy.get(i);
        if ((frameCount%s==0) && (motion == true))
        {
          e.update();
          if (e.pos.x+40>=500||e.pos.x+40<=30)
          {
            motion = false;
            drop();
            counter++;
            if(counter%2==0)
            {
              if(s>5)
              {
                s-=5;
              }
            }
            motion = true;
          }
        }
        
        if (frameCount%240 == 0 )
        {
          if (i == enemyfire)
          {
            enemybullet.add(new EnemyBullet(e.pos));
          }
        }
        e.render();
      }
      for (int i =0; i <playerbullet.size(); i++)
      {
        PlayerBullet b = playerbullet.get(i);
        b.render();
        b.update();
      }
      for (int j=0; j<enemybullet.size(); j++)
      {
        EnemyBullet eb = enemybullet.get(j);
        eb.render();
        eb.update();
      }
      if (player.lives<=0)
      {
        gameOver();
      }
      break;
    case 2:
      //seeScores();
      break;
    case 3:
      howtoplay();
      break;
    }//end switch
  }//end else
}

void displayMenu()
{
  background(0);
  textFont(NameFont);
  fill(255);
  textAlign(CENTER);
  text("SPACE INVADERS", 250, 100);
  textFont(OptionFont);
  fill(255);
  textAlign(CENTER);
  text("1. Play Game", 250, 200);
  text("2. See Scores", 250, 300);
  text("3. How to Play", 250, 400);
}

void howtoplay()
{
  background(0);
  textFont(ExplainFont);
  fill(255);
  textAlign(CENTER);
  text("The aim of the game is to\nstop the aliens landing!!\nAvoid their bullets and\nshoot them back.\nTo move your tank, hit the\nw,a,s and d keys or else\nuse the arrows on\nyour keyboard.", 250, 50);
  text("Press b for Main Screen", 250, 450);
  if (userMenu==0)
  {
    displayMenu();
  }
}

void drop()
{
  for (Enemies ship : enemy)
  {
    ship.pos.add(ship.drop);
  }
}

/*void seeScores()
 {
 
 if(userMenu==0)
 {
 displayMenu();
 }
 }*/

void gameOver()
{
  background(0);
  textFont(NameFont);
  fill(255);
  textAlign(CENTER);
  text("GAME OVER", 250, 250);
  textFont(ExplainFont);
  text("SCORE:"+player.score,250,300);
  text("Press b for Main Screen", 250, 450);
  if (userMenu == 0)
  {
    player.lives=3;
    gameReset();
    println(player.lives);
    displayMenu();
  }
  //run through everyting and reset like david said
}

void gameReset()
{
  for (int i = 0; i<enemy.size(); i++)
  {
    Enemies e = enemy.get(i);
    enemy.remove(e);
  }

  for (int i=0; i<4; i++)
  {
    Shelter s = new Shelter(shelterx[i], 400);
    shelter.add(s);
  }

  for (int y = 10; y<90; y+=30)
  {
    for (int x =40; x<=240; x+=60)
    {
      enemy.add(new Enemies(x, y));
    }
  }

  player.lives = 3;
}

void keyPressed()
{
  if (key != CODED)
  {
    if (key == '1')
    {
      userMenu = 1;
    }
    if (key == '2')
    {
      userMenu = 2;
    }
    if (key == '3')
    {
      userMenu = 3;
    }
    if (key == 'b')
    {
      userMenu = 0;
    }
    if (key == 'a')
    {
      if (player.pos.x > 20)
      {
        player.pos.sub(10, 0);
      }
    }
    if (key == 'd')
    {
      if (player.pos.x < width-20)
      {
        player.pos.add(10, 0);
      }
    }
    if (key == 'w')
    {
      playerbullet.add(new PlayerBullet());
    }
  }
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      if (player.pos.x > 20)
      {
        player.pos.sub(10, 0);
      }
    }
    if (keyCode == RIGHT)
    {
      if (player.pos.x < width-20)
      {
        player.pos.add(10, 0);
      }
    }
  }
}//end key checking