class ball
{
  ball()
  {
  }
  void drawBall()
  {
    ball = new PVector(ballX, ballY);
    fill(255);
    stroke(0);
    ellipse(ball.x, ball.y, ballr, ballr);

    ballX+=Speed*dirX-fric;
    fric+=fric/25;
    if (fric>Speed*dirX)
    {
      fric = 0;
      Speed = 0;
    }
  }
}