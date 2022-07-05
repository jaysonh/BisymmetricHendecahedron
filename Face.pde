/*
 Represents one face of the hendacoahendron
 */
class Face
{
   Face(int id)
   {
     this.id = id;
     points.clear();
   }
   
   int getFaceID()
   {
      return id; 
   }
   
   void calcCentre()
   {
     if(points.size() >= 3 )
      {      
        // calculate normal  
        normal = PVector.cross(PVector.sub(points.get(1),points.get(0),null), PVector.sub(points.get(2), points.get(0),null),null);
        normal.normalize();
                
        // calculate centroid        
        float x = 0.0;        
        float y = 0.0;
        float z = 0.0;
        
        for(int i = 0; i < points.size();i++)
        {
           x += points.get(i).x;
           y += points.get(i).y;
           z += points.get(i).z;        
        }
        centroid = new PVector( x / (float)points.size(), y  / (float)points.size(), z / (float)points.size());
        
      }
   }
   void addPoint( PVector p )
   {
      points.add(p); 
      
      
   }
   
   void addOffset(PVector off )
   {
      for( PVector p : points)
      {
        p.x -= off.x;
        p.y -= off.y;
        p.z -= off.z;
      }
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
   
   void drawConnect()
   {
      strokeWeight(2.0);
      float lineLen = 2.0;
      stroke(255,0, 255);
      //line( centroid.x - normal.x * lineLen, centroid.y - normal.y * lineLen, centroid.z - normal.z * lineLen,
      //      centroid.x + normal.x * lineLen, centroid.y + normal.y * lineLen, centroid.z + normal.z * lineLen);
      pushMatrix();
      translate(centroid.x, centroid.y, centroid.z);
      
      sphere(0.5);
      popMatrix();
      
      //line( centroid.x, centroid.y, centroid.z ,
      //      centroid.x + normal.x * lineLen, centroid.y + normal.y * lineLen, centroid.z + normal.z * lineLen);
     
   }
   
   void addNormal(PVector n)
   {
     for( PVector p : points )
     {
        p.add(n); 
     }
   }
   
   PVector getNormal() { return normal;   }
   PVector getCenter() { return centroid; }
   PVector normal;
   PVector centroid;
   ArrayList <PVector> points = new ArrayList(); 
   int id;
}
