class Cars1
{
  int c = 0;
  PVector velocity;
  Cars1()
  {

    pos = new PVector(width/4, height/2);
    Forward1 = new PVector(speed, 0);
    velocity = new PVector(0, 0);
  }
  void draw()
  {
    if (reset == true)
    {
      pos.x = width/4;
      pos.y = height/2;
      r = 0;
    }
    strokeWeight(2);
    pushMatrix();
    fill(0, 0, 255);
    stroke(255);
    translate(pos.x, pos.y);
    rotate(r);
    if (forward1 == true)
    {
      PVector dir =  Forward1.copy();
      dir.rotate(r);
      dir.normalize();
      dir.mult(speed);
      pos.add(dir);
    }
    if (backward1 == true)
    {
      PVector dir =  Forward1.copy();
      dir.rotate(r);
      dir.normalize();
      dir.mult(speed);
      pos.sub(dir);
    }
    if (left1 == true && ableToTurn1 == true)
    {
      r-= PI/30;
    }
    if (right1 == true && ableToTurn1 == true)
    {
      r+= PI/30;
    }
    rect(0, 0, sizeY, sizeX);
    popMatrix();
    checkBoundary();
    if (checkCollision() == true)
    {
      PVector tempPlayer = pos.copy();
      tempPlayer.sub(pos2);
      tempPlayer.setMag(2*speed);
      velocity = tempPlayer;
    } else
    {
      velocity.x = 0;
      velocity.y = 0;
    }
    pos.add(velocity);
  }


  boolean collideCircleWithRotatedRectangle1 (PVector circle, PVector rect ) 
  {

    float rectCenterX = rect.x;
    float rectCenterY = rect.y;

    float rectX = rectCenterX - sizeX / 2;
    float rectY = rectCenterY - sizeY / 2;

    float rectReferenceX = rectX;
    float rectReferenceY = rectY;

    // Rotate circle's center point back
    double unrotatedCircleX = cos( r ) * ( circle.x - rectCenterX ) - sin( r ) * ( circle.y - rectCenterY ) + rectCenterX;
    double unrotatedCircleY = sin( r ) * ( circle.x - rectCenterX ) + cos( r ) * ( circle.y - rectCenterY ) + rectCenterY;

    // Closest point in the rectangle to the center of circle rotated backwards(unrotated)
    double closestX, closestY;

    // Find the unrotated closest x point from center of unrotated circle
    if ( unrotatedCircleX < rectReferenceX )
    {
      closestX = rectReferenceX;
    } else if ( unrotatedCircleX > rectReferenceX + sizeX ) 
    {
      closestX = rectReferenceX + sizeX;
    } else
    {
      closestX = unrotatedCircleX;
    }

    // Find the unrotated closest y point from center of unrotated circle
    if ( unrotatedCircleY < rectReferenceY ) 
    {
      closestY = rectReferenceY;
    } else if ( unrotatedCircleY > rectReferenceY + sizeY ) 
    {
      closestY = rectReferenceY + sizeY;
    } else
    {
      closestY = unrotatedCircleY;
    }

    // Determine collision
    boolean collision = false;
    double distance = getDistance( unrotatedCircleX, unrotatedCircleY, closestX, closestY );

    if ( distance < ballr )
    {
      collision = true;
    } else 
    {
      collision = false;
    }

    return collision;
  }

  double getDistance(double fromX, double fromY, double toX, double toY )
  {
    double dX = Math.abs( fromX - toX );
    double dY = Math.abs( fromY - toY );
    return Math.sqrt( ( dX * dX ) + ( dY * dY ) );
  }

  void checkBoundary()
  {
    if (pos.x>width-sizeY/2)
    {
      pos.x-=speed;
    }
    if (pos.x<sizeY/2)
    {
      pos.x+=speed;
    }
    if (pos.y>height-sizeY/2)
    {
      pos.y-=speed;
    }
    if (pos.y<sizeY/2)
    {
      pos.y+=speed;
    }
  }

  boolean checkCollision()
  {
    if (dist(pos.x, pos.y, pos2.x, pos2.y)<sizeY)
    {
      return true;
    } else
    {
      return false;
    }
  }
}