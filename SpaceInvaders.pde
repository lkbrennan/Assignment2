/*Assignment 2
Student Name: Lauren Keenan Brennan
Student Number: C15434102
Date: 6/2/2017
*/

PFont NameFont;
PFont OptionFont;

void setup()
{
  size(500,500);

  NameFont = createFont("AR DESTINE",55);
  OptionFont = createFont("AR DESTINE",35);
  
}

int userMenu = 0;

void draw()
{
  background(0);
  
  if(keyPressed)
  {
    if(key == 1)
    {
      userMenu = 1;
    }
    if(key == 2)
    {
      userMenu = 2;
    }
    if(key == 3)
    {
      userMenu = 3;
    }
  }
  
  if(userMenu == 0)
  {
    displayMenu();
  }
  if(userMenu != 0)
  {
  /*switch(userMenu)
  {
    case 1:
      background
      break;
    case 2:
      //scores.see
      break;
    case 3:
      //how to play
      break;
  } //end switch */
  }
  println(userMenu);
}

void displayMenu()
{
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

/*void keyPressed()
  {
    if(key == 1)
    {
      userMenu = 1;
    }
    if(key == 2)
    {
      userMenu = 1;
    }
    if(key == 3)
    {
      userMenu = 3;
    }
    else
    {
      userMenu = 0;
    }
  }//end key checking*/