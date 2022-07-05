class Hendecahedron
{
    Hendecahedron(PApplet appRef, PVector offset)
    {
      ui = new ControlP5( appRef );
      ui.setAutoDraw(false);
      selectedFace = ui.addNumberbox("numberbox")
                       .setSize(200,20)
                       .setRange(1,11)
                       .setPosition(600,20)
                       .setScrollSensitivity(2.01)
                       .setValue(1)       ;
    
      
      A = new PVector( 0, 0, 2);
      B = new PVector( 2, 1, 1);
      C = new PVector( 0,-1, 1);
      D = new PVector(-2, 1, 1);
      E = new PVector( 0, 2, 0);
      F = new PVector( 1,-1, 0);
      G = new PVector(-1,-1, 0);
      H = new PVector( 2, 1,-1);
      J = new PVector( 0,-1,-1);
      K = new PVector(-2, 1,-1);
      L = new PVector( 0, 0,-2);
      
      A.mult(10.0);
      B.mult(10.0);
      C.mult(10.0);
      D.mult(10.0);
      E.mult(10.0);
      F.mult(10.0);
      G.mult(10.0);
      H.mult(10.0);
      J.mult(10.0);
      K.mult(10.0);
      L.mult(10.0);
      
      A.add(offset);
      B.add(offset);
      C.add(offset);
      D.add(offset);
      E.add(offset);
      F.add(offset);
      G.add(offset);
      H.add(offset);
      J.add(offset);
      K.add(offset);
      L.add(offset);
      
      ABED = new Face(1);
      ABFC = new Face(2);
      ACGD = new Face(3);
      BEH  = new Face(4);
      BHF  = new Face(5);
      CFJG = new Face(6);
      DGK  = new Face(7);
      DKE  = new Face(8);
      EKLH = new Face(9);
      FHLJ = new Face(10);
      GJLK = new Face(11);
      
      //ABED
      ABED = new Face(1);
      ABED.addPoint(A);
      ABED.addPoint(B);
      ABED.addPoint(E);
      ABED.addPoint(D);
      ABED.calcCentre();
      
      //ABFC
      ABFC = new Face(2);
      ABFC.addPoint(A);
      ABFC.addPoint(B);
      ABFC.addPoint(F);
      ABFC.addPoint(C);
      ABFC.calcCentre();
      
      //ACGD
      ACGD = new Face(3);
      ACGD.addPoint(A);
      ACGD.addPoint(C);
      ACGD.addPoint(G);
      ACGD.addPoint(D);
      ACGD.calcCentre();
      
      //BEH
      BEH = new Face(4);
      BEH.addPoint(B);
      BEH.addPoint(E);
      BEH.addPoint(H);
      BEH.calcCentre();
      
      //BHF
      BHF = new Face(5);
      BHF.addPoint(B);
      BHF.addPoint(H);
      BHF.addPoint(F);
      BHF.calcCentre();
      
      //CFJG
      CFJG = new Face(6);
      CFJG.addPoint(C);
      CFJG.addPoint(F);
      CFJG.addPoint(J);
      CFJG.addPoint(G);
      CFJG.calcCentre();
      
      //DGK
      DGK = new Face(7);
      DGK.addPoint(D);
      DGK.addPoint(G);
      DGK.addPoint(K);
      DGK.calcCentre();
      
      //DKE
      DKE = new Face(8);
      DKE.addPoint(D);
      DKE.addPoint(K);
      DKE.addPoint(E);
      DKE.calcCentre();
      
      //EKLH
      EKLH = new Face(9);
      EKLH.addPoint(E);
      EKLH.addPoint(K);
      EKLH.addPoint(L);
      EKLH.addPoint(H);
      EKLH.calcCentre();
      
      //FHLJ
      FHLJ = new Face(10);
      FHLJ.addPoint(F);
      FHLJ.addPoint(H);
      FHLJ.addPoint(L);
      FHLJ.addPoint(J);
      FHLJ.calcCentre();
      
      //GJLK
      GJLK = new Face(11);
      GJLK.addPoint(G);
      GJLK.addPoint(J);
      GJLK.addPoint(L);
      GJLK.addPoint(K);
      GJLK.calcCentre();
      
      faces.add(ABED );
      faces.add(ABFC );
      faces.add(ACGD );
      faces.add(BEH  );
      faces.add(BHF  );
      faces.add(CFJG );
      faces.add(DGK  );
      faces.add(DKE  );
      faces.add(EKLH );
      faces.add(FHLJ );
      faces.add(GJLK );
    }
    
    void export()
    {
      PGraphics pdf = createGraphics(4961, 3508, PDF, "output.pdf");
      pdf.beginDraw();
      pdf.background(255, 255, 255);
      pdf.line(50, 50, 250, 250);
      pdf.dispose();
      pdf.endDraw();
    }
    
    void rotateShape(PVector rot )
    {
      // rot is target vector
      
      // calc diff between target vector and selected face rot
      PVector selNor = getSelectedFace().getNormal();
      
      PVector diffNorm = new PVector( rot.x - selNor.x, rot.y - selNor.y, rot.z - selNor.z);
           
      // go through each face and line up with this face       
      for(Face f : faces)
      {
          f.addNormal(diffNorm);
      }
    }
    
    void drawUI()
    {
      ui.draw();
    }
    
    void setConnection( PVector _centre, PVector _normal )
    {
        for(Face f : faces)
        {
           f.addOffset(_centre); 
           f.calcCentre();
        }
    }
    
    void setSize( float _size )
    {
      viewScale = _size;
    }
    
    void draw()
    {
      
        pushMatrix();
        //scale( viewScale );
        
        for(Face f : faces)
        {
           f.draw(); 
           
           if( f.getFaceID() == (int)(selectedFace.getValue()) )
           {
             f.drawConnect();
           }
        }
        popMatrix();
    }
    
    Face getSelectedFace()
    {
        return faces.get( (int)(selectedFace.getValue()) );
    }
    
    Numberbox selectedFace;
    ControlP5 ui;
    
    float getSize() { return viewScale; }
    
    private float viewScale = 25.0;
    
    PVector A, B, C, D, E, F, G, H, J, K, L;
    Face ABED ;
    Face ABFC ;
    Face ACGD ;
    Face BEH  ;
    Face BHF  ;
    Face CFJG ;
    Face DGK  ;
    Face DKE  ;
    Face EKLH ;
    Face FHLJ ;
    Face GJLK ;

    ArrayList <Face> faces = new <Face> ArrayList();
    
}
