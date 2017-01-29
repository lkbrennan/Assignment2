/*Assignment 2
Student Name: Lauren Keenan Brennan
Student Number: C15434102
Date: 6/2/2017
*/

void setup()
{
  size(500,500);
  
}

char userMenu;

void draw()
{
  background(0);
  
  if(keyPressed)
  {
    if(key == '1')
    {
      userMenu = '1';
    }
    if(key == 2)
    {
      userMenu = '2';
    }
    if(key == 3)
    {
      userMenu = '3';
    }
    else
    {
    }
  }
  switch(userMenu)
  {
    case '1':
      //game.play
      break;
    case '2':
      //scores.see
      break;
    case '3':
      //how to play
      break;
  } //end switch
  
}

void keyPressed()
{
  
}