class Cars
{
    int c = 0;
  Cars()
  {

    pos = new PVector(width/2, height/2);
    Forward = new PVector(speed, 0);
  }
  void draw1()
  {
    strokeWeight(2);
    pushMatrix();
    fill(c);
    stroke(255);
    translate(pos.x, pos.y);
    rotate(r);
    if (forward == true)
    {
      PVector dir =  Forward.copy();
      dir.rotate(r);
      dir.normalize();
      dir.mult(speed);
      pos.add(dir);
    }
    if (backward == true)
    {
      PVector dir =  Forward.copy();
      dir.rotate(r);
      dir.normalize();
      dir.mult(speed);
      pos.sub(dir);
    }
    if (left == true && ableToTurn == true)
    {
      r-= PI/60;
    }
    if (right == true && ableToTurn == true)
    {
      r+= PI/60;
    }
    if (boostAvailable == true && boosting == true);
    {
      boost-=0.1;
      speed = 20;
    }
    if (boosting==false)
    {
      speed = 10;
    }
    rect(0, 0, sizeY, sizeX);
    popMatrix();
    if(collideCircleWithRotatedRectangle(ball,pos) == true)
    {
      c = 47;
    } else
    {
      c = 0;
    }
  }


  boolean collideCircleWithRotatedRectangle (PVector circle,PVector rect ) {

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

  double getDistance(double fromX,double fromY,double toX,double toY )
  {
    double dX = Math.abs( fromX - toX );
    double dY = Math.abs( fromY - toY );
    return Math.sqrt( ( dX * dX ) + ( dY * dY ) );
  }
}