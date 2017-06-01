class Cars2
{
  PVector velocity;
  Cars2()
  {
    pos2 = new PVector(3*(width/4), height/2);
    Forward2 = new PVector(speed*2, 0);
    velocity = new PVector(0, 0);
  }
  void draw()
  {
    if (reset == true)
    {
      pos2.x = 3*width/4;
      pos2.y = height/2;
      r2 = PI;
    }
    strokeWeight(2);
    pushMatrix();
    fill(255, 0, 0);
    stroke(255);
    translate(pos2.x, pos2.y);
    rotate(r2);
    if (forward2 == true)
    {

      PVector dir =  Forward2.copy();
      dir.rotate(r2);
      dir.normalize();
      dir.mult(speed);
      pos2.add(dir);
    }
    if (backward2 == true)
    {
      PVector dir =  Forward2.copy();
      dir.rotate(r2);
      dir.normalize();
      dir.mult(speed);
      pos2.sub(dir);
    }

    if (left2 == true && ableToTurn2 == true)
    {
      r2-= PI/30;
    }
    if (right2 == true && ableToTurn2 == true)
    {
      r2+= PI/30;
    }
    rect(0, 0, sizeY, sizeX);
    popMatrix();
    checkBoundary();
    if (checkCollision() == true)
    {
      PVector tempPlayer = pos2.copy();
      tempPlayer.sub(pos);
      tempPlayer.setMag(2*speed);
      velocity = tempPlayer;
    } else
    {
      velocity.x = 0;
      velocity.y = 0;
    }
    pos2.add(velocity);
  }


  boolean collideCircleWithRotatedRectangle2 (PVector circle, PVector rect ) 
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
    if (pos2.x>width-sizeY/2)
    {
      pos2.x-=speed;
    }
    if (pos2.x<sizeY/2)
    {
      pos2.x+=speed;
    }
    if (pos2.y>height-sizeY/2)
    {
      pos2.y-=speed;
    }
    if (pos2.y<sizeY/2)
    {
      pos2.y+=speed;
    }
  }
  boolean checkCollision()
  {
    if (dist(pos2.x, pos2.y, pos.x, pos.y)<sizeY)
    {
      return true;
    } else
    {
      return false;
    }
  }
}