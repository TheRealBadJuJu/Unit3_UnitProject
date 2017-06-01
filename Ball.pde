class ball
{
  PVector vel;
  PVector Ball;
  ball()
  {
    vel = new PVector(0, 0);
    ballX = width/2;
    ballY = height/2;
    Ball = new PVector(ballX, ballY);
  }
  void drawBall()
  {
    //this is the reset code implemented after any player scores a point
    if (reset == true)
    {
      Ball.x = width/2;
      Ball.y = height/2;
      vel.x = 0;
      vel.y = 0;
      reset = false;
    }
    fill(255);
    stroke(0);
    ellipse(Ball.x, Ball.y, ballr, ballr);
    if (c.collideCircleWithRotatedRectangle1(Ball, pos) == true)
    {
      PVector newDir = Ball.copy();
      newDir.sub(pos);
      newDir.normalize();
      newDir.mult(Speed);
      vel = newDir;
    }
    if (c2.collideCircleWithRotatedRectangle2(Ball, pos2) == true)
    {
      PVector newDir = Ball.copy();
      newDir.sub(pos2);
      newDir.normalize();
      newDir.mult(Speed);
      vel = newDir;
    }
    update();
  }
  void update()
  {
    Ball.add(vel);
    friction();
    if (Ball.x<ballr/2||Ball.x>width-ballr/2)
    {
      vel.x=-vel.x;
    }
    if (Ball.y<ballr/2||Ball.y>height-ballr/2)
    {
      vel.y=-vel.y;
    }
    if (Ball.x<ballr/2+1&& Ball.y>height/3&&Ball.y<2*(height/3))
    {
      scoreRed++;
      reset = true;
    }
    if (Ball.x>width-ballr/2-1&& Ball.y>height/3&&Ball.y<2*(height/3))
    {
      scoreBlue++;
      reset = true;
    }
    if (Ball.x<0||Ball.x>width||Ball.y<0||Ball.y>height)
    {
      Ball.x = width/2;
      Ball.y = height/2;
      vel.y = 0;
      vel.x = 0;
    }
  }
  void friction()
  {
    vel.x=vel.x*0.99;
    vel.y=vel.y*0.99;
  }
}