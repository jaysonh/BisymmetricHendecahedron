import controlP5.*;
import processing.pdf.*;

Hendecahedron h;
Ruler ruler;
CameraView camera;

ControlP5 ui;
Hendecahedron selectedShape;

ArrayList <Hendecahedron> shapeList = new <Hendecahedron> ArrayList();

void setup()
{
  size(800,800, OPENGL); 
  
  // set up user interface
  ui    = new ControlP5(this);
  ui.addSlider("size")
    .setPosition(10,10)
    .setRange(0,100)
    .setSize(200,20)
     ;
  ui.addButton("new shape");
  ui.addButton("export A3");
  ui.setAutoDraw(false);
  // set up scene objects
  camera = new CameraView();
  h      = new Hendecahedron(this, new PVector(0,0,0));
  ruler  = new Ruler();
  
  shapeList.add(h);
  selectedShape = h;
}

void draw()
{
  background(0);
  
  // Draw user interfaces
  ui.draw();
  
  if( selectedShape != null )
  {
    selectedShape.drawUI();
  }
  
  // Draw 3D shapes
  lights();
  pushMatrix();
  pushStyle();
  camera.update();
 
  ruler.draw(h.getSize());
  
  for( Hendecahedron h : shapeList)
  {
    h.draw();
  }
  
  popMatrix();
  popStyle();
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController())
  {    
    // size slider pressed
    if( theEvent.getController().getName() == "size")
    {        
      //h.setSize( theEvent.getController().getValue() ); 
    }     
    
    if( theEvent.getController().getName() == "export A3")
    { 
      h.export();
    }
    
    // New shape button pressed
    if( theEvent.getController().getName() == "new shape")
    {        
      //h.setSize( theEvent.getController().getValue() ); 
      
      Face connectedFace = selectedShape.getSelectedFace();
      PVector center = connectedFace.getCenter();
      PVector normal = connectedFace.getNormal();
      
      //center = new PVector(40,0,0);
      Hendecahedron newShape = new Hendecahedron(this, center);
      //newShape.rotateShape(normalz);
      //newShape.setConnection( center, normal );
      
      shapeList.add(newShape);
      //println("add new shape");
    }       
    
  }
}
