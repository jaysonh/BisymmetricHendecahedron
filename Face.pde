/*
 Represents one face of the hendacoahendron
 */
class Face
{
   Face()
   {
     points.clear();
   }
   
   void addPoint( PVector p )
   {
      points.add(p); 
   }
   
   void draw()
   {
     noStroke();
      beginShape();
      for( PVector p : points)
      {
        vertex(p.x,p.y,p.z);
      }
      endShape(CLOSE);
   }
   ArrayList <PVector> points = new ArrayList(); 
}
