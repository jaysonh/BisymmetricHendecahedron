class Ruler
{
    Ruler()
    {
      
    }
    
    void draw(float shapeSize)
    {
      pushStyle();
        // draw bounding box
        noFill();
        strokeWeight(2);
        stroke(0,255,0);
        
        box(shapeSize * 4.0, shapeSize * 2.0,shapeSize * 4.0);
        
        fill(255);
        pushMatrix();
          scale(-1,1,1);
          text(shapeSize + "mm", shapeSize * 2.0, shapeSize * -1.0);
        popMatrix();
        
        pushMatrix();
          scale(-1,1,1);
          translate(0,0,shapeSize * 2.0);
          text(shapeSize + "mm", shapeSize * 2.0, shapeSize * 0.0);
        popMatrix();
        
        
        pushMatrix();
          scale(-1,1,1);
          translate(0,0,shapeSize * 2.0);
          text(shapeSize + "mm", 0, shapeSize * -1.0);
        popMatrix();
        
        
        popStyle();
    }
}
