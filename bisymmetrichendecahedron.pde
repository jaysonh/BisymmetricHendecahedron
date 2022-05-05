import controlP5.*;

Hendecahedron h;
Ruler ruler;
CameraView camera;

ControlP5 ui;

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
  ui.setAutoDraw(false);
  // set up scene objects
  camera = new CameraView();
  h      = new Hendecahedron();
  ruler  = new Ruler();
}

void draw()
{
  background(0);
  ui.draw();
  lights();
  pushMatrix();
  pushStyle();
  camera.update();
 
  ruler.draw(h.getSize());
  h.draw();
  popMatrix();
  popStyle();
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController())
  {    
    // size slider pressed
    if( theEvent.getController().getName() == "size")
    {        
      h.setSize( theEvent.getController().getValue() ); 
    }    
  }
}
