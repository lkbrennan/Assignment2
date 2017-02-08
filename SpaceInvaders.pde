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


//importing minim library for background music
import ddf.minim.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer theme;

//background image
PImage background;

//sprites for aliens
PImage alien;
PImage mstr;


//Game fonts
PFont NameFont;
PFont OptionFont;
PFont ExplainFont;
PFont GameFont;


//initialising classes and arraylists
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

  minim = new Minim(this);
  theme = minim.loadFile("Theme.mp3", 2048);

  //loading images
  background = loadImage("space.jpg");
  alien = loadImage("sprite.png");
  mstr = loadImage("master.png");

  //creating fonts
  NameFont = createFont("AR DESTINE", 55);
  OptionFont = createFont("AR DESTINE", 35);
  ExplainFont = createFont("AR DESTINE", 32);
  GameFont = createFont("AR DESTINE", 25);

  //calling all classes and arraylists
  player = new Player();
  shelter = new ArrayList<Shelter>();
  enemy= new ArrayList<Enemies>();
  playerbullet = new ArrayList<PlayerBullet>();
  enemybullet = new ArrayList<EnemyBullet>();
  master = new ArrayList<Master>();
  booster = new ArrayList<Booster>():

  //adding shelters
  for (int i=0; i<4; i++)
  {
    Shelter s = new Shelter(shelterx[i], 400);
    shelter.add(s);
  }

  //adding enemies
  for (int y = 40; y<=130; y+=30)
  {
    for (int x =40; x<=240; x+=60)
    {
      enemy.add(new Enemies(x, y));
    }
  }

  //plays theme song
  theme.loop();
}

//variable to change screens
int userMenu = 0;

//counters to move the enemies
int counter = 1;
int s = 30;

//x values of the shelters
int[] shelterx = {50, 170, 290, 410};

boolean motion = true;

//variable to randomly create enemy bulletss
int enemyfire;

//variable to randomly create life booster
int booster;

void draw()
{
  image(background, 0, 0);

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
      
      //every 8 seconds a master enemy ship will be created and appear in the top of the screen
      if (frameCount%480==0)
      {
        master.add(new Master(0, 10));
        booster = int(random(0,10));
        //if(booster>5)
        //{
          
      }

      for (int i=0; i<master.size(); i++)
      {
        Master m = master.get(i);
        if (frameCount%5==0)
        {
          m.update();
        }
        m.render();
      }

      //if the enemy array is equal to 0, the game will reset, except for player lives
      if (enemy.size()==0)
      {
        gameReset();
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
            if (counter%2==0)
            {
              if (s>5)
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
      
      if (player.lives==0)
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

//method for display screen
void displayMenu()
{
  image(background, 0, 0);
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

//method for how to play screen
void howtoplay()
{
  image(background, 0, 0);
  textFont(ExplainFont);
  fill(255);
  textAlign(CENTER);
  text("The aim of the game is to\nstop the aliens landing!!\nAvoid their bullets and\nshoot them back.\nTo move your tank, hit the\nw,a,s and d keys or else\nuse the arrows on\nyour keyboard.", 250, 50);
  text("Press b for Main Screen", 250, 450);
  //if b is pressed, display menu is showed
  if (userMenu==0)
  {
    displayMenu();
  }
}

//methos to drop enemy ships by 10 pixels
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

//Game over screen displayed when user loses game
void gameOver()
{
  background(0);
  textFont(NameFont);
  fill(255);
  textAlign(CENTER);
  text("GAME OVER", 250, 250);
  textFont(ExplainFont);
  text("SCORE:"+player.score, 250, 300);
  text("Press b for Main Screen", 250, 450);
  if (userMenu == 0)
  {
    displayMenu();
  }
}


//function to reset the game if the player loses or if all the aliens die
void gameReset()
{
  counter = 1;
  s = 30;

  //removes enemies from arraylists
  for (int i = 0; i<enemy.size(); i++)
  {
    Enemies e = enemy.get(i);
    enemy.remove(e);
  }

  //removes shelters from arraylists
  for (int i = 0; i<shelter.size(); i++)
  {
    Shelter s = shelter.get(i);
    shelter.remove(s);
  }

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

void keyPressed()
{
  if (key != CODED)
  {
    //pressing the 1,2,3 and b keys reset the userMenu variable, which triggers different display screens
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
      //if b is pressed player.lives is reset to 0 to end the gameOver() method
      //and the game is reset
      player.lives=3;
      gameReset();
    }
    //a and d keys to move player left and right
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
    //w and space key shoots
    if (key == 'w')
    {
      playerbullet.add(new PlayerBullet());
    }
    if (key == ' ')
    {
      playerbullet.add(new PlayerBullet());
    }
  }
  if (key == CODED)
  {
    //keys to move player left and right
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