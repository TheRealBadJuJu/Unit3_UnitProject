Screen scr;
Cars c;
ball b;
float r = 4;
float boost = 100;
float carY;
float carX;
float speed = 10;
float Speed = 10;
float fric = 0.5;
int dirX = 1;
int dirY = 1;
int ballX = width/4;
int ballY = 0;
int _x;
int _y;
int _X = width/2;
int _Y = height/2;
int sizeY = 50;
int sizeX = 70;
int ballr = 50;
boolean forward;
boolean ableToTurn;
boolean backward;
boolean right;
boolean boostAvailable;
boolean boosting;
boolean left;
PVector pos;
PVector Forward;
PVector ball;


void setup()
{

  rectMode(CENTER);
  fullScreen();

  c = new Cars();
  b = new ball();
  _x = 0;
  _y = 0;
  _X = width/2;
  _Y = height/2;
  ballX = width/4;
  ballY = height/2;
}


void draw()
{
  // background(0);
  background(3, 137, 62);

  fill(0, 0, 0, 0);
  strokeWeight(11);
  stroke(255);
  rect(width/2, height/2, width-10, height-10);
  line(width/2, 0, width/2, height);
  ellipse(width/2, height/2, height/2.5, height/2.5);
  rect(width/17, height/2, width/9.1, height/2);
  rect(width-width/17, height/2, width/9.1, height/2);

  c.draw1();
  b.drawBall();
  if (boost>0)
  {
    boostAvailable= true;
  }
}
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      forward = false;
      ableToTurn = false;
    }
    if (keyCode == DOWN)
    {
      backward = false;
      ableToTurn = false;
    }
    if (keyCode == RIGHT)
    {
      right = false;
    }
    if (keyCode == LEFT)
    {
      left = false;
    }
    if (keyCode == SHIFT)
    {
      boosting = false;
    }
  }
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      forward = true;
      ableToTurn = true;
    }
    if (keyCode == DOWN)
    {
      backward = true;
      ableToTurn = true;
    }
    if (keyCode == RIGHT)
    {
      right = true;
    }
    if (keyCode == LEFT)
    {
      left = true;
    }
    if (keyCode == SHIFT)
    {
      boosting = true;
    }
  }
}