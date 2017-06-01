
/*
 This is a 2d rocket league similar game made by me
 
 Blue is controlled by WASD keys
 Red is controlled by the arrow keys
 */
Cars1 c;
Cars2 c2;
ball b;
boolean reset;
float r = 0;
float r2 = PI;
float car1Y;
float car1X;
float speed = 10;
float Speed = 10;
int dirX = 1;
int dirY = 1;
int ballX = width/2;
int ballY = height/2;
int _x;
int _y;
int _X = width/2;
int _Y = height/2;
int sizeY = 70;
int sizeX = 50;
int ballr = 50;
int scoreBlue = 0;
int scoreRed = 0;
boolean forward1;
boolean forward2;
boolean ableToTurn1;
boolean ableToTurn2;
boolean backward1;
boolean backward2;
boolean right1;
boolean right2;
boolean left1;
boolean left2;
PVector pos;
PVector pos2;
PVector Forward1;
PVector Forward2;



void setup()
{

  rectMode(CENTER);
  fullScreen();
  textAlign(CENTER);
  c = new Cars1();
  c2 = new Cars2();
  b = new ball();
  _x = 0;
  _y = 0;
  _X = width/4;
  _Y = height/2;
  ballX = width/2;
  ballY = height/2;
}


void draw()
{
  //This is the Arena being drawn
  background(3, 137, 62);
  fill(0, 0, 0, 0);
  strokeWeight(11);
  stroke(255);
  rect(width/2, height/2, width-10, height-10);
  line(width/2, 0, width/2, height);
  ellipse(width/2, height/2, height/2.5, height/2.5);
  rect(width/17, height/2, width/9.1, height/2);
  rect(width-width/17, height/2, width/9.1, height/2);

  //Drawing in the ball and cars
  b.drawBall();
  c.draw();
  c2.draw();

  // This is the scoreboard code
  fill(0, 0, 255);
  textSize(50);
  text(scoreBlue, width/2-50, 50);
  fill(255, 0, 0);
  text(scoreRed, width/2+50, 50);
}

//Anything underneath here are the movement booleans for the cars

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      forward2 = false;
      ableToTurn2 = false;
    }
    if (keyCode == DOWN)
    {
      backward2 = false;
      ableToTurn2 = false;
    }
    if (keyCode == RIGHT)
    {
      right2 = false;
    }
    if (keyCode == LEFT)
    {
      left2 = false;
    }
  }
  if (key == 'w')
  {
    forward1 = false;
    ableToTurn1 = false;
  }
  if (key == 's')
  {
    backward1 = false;
    ableToTurn1 = false;
  }
  if (key == 'd')
  {
    right1 = false;
  }
  if (key == 'a')
  {
    left1 = false;
  }
}


void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      forward2 = true;
      ableToTurn2 = true;
    }
    if (keyCode == DOWN)
    {
      backward2 = true;
      ableToTurn2 = true;
    }
    if (keyCode == RIGHT)
    {
      right2 = true;
    }
    if (keyCode == LEFT)
    {
      left2 = true;
    }
  }
  if (key == 'w')
  {
    forward1 = true;
    ableToTurn1 = true;
  }
  if (key == 's')
  {
    backward1 = true;
    ableToTurn1 = true;
  }
  if (key == 'd')
  {
    right1 = true;
  }
  if (key == 'a')
  {
    left1 = true;
  }
}