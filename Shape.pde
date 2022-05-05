class Hendecahedron
{
    Hendecahedron()
    {
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
      
      ABED = new Face();
      ABFC = new Face();
      ACGD = new Face();
      BEH  = new Face();
      BHF  = new Face();
      CFJG = new Face();
      DGK  = new Face();
      DKE  = new Face();
      EKLH = new Face();
      FHLJ = new Face();
      GJLK = new Face();
      
      //ABED
      ABED = new Face();
      ABED.addPoint(A);
      ABED.addPoint(B);
      ABED.addPoint(E);
      ABED.addPoint(D);
      
      //ABFC
      ABFC = new Face();
      ABFC.addPoint(A);
      ABFC.addPoint(B);
      ABFC.addPoint(F);
      ABFC.addPoint(C);
      
      //ACGD
      ACGD = new Face();
      ACGD.addPoint(A);
      ACGD.addPoint(C);
      ACGD.addPoint(G);
      ACGD.addPoint(D);
      
      //BEH
      BEH = new Face();
      BEH.addPoint(B);
      BEH.addPoint(E);
      BEH.addPoint(H);
      
      //BHF
      BHF = new Face();
      BHF.addPoint(B);
      BHF.addPoint(H);
      BHF.addPoint(F);
      
      //CFJG
      CFJG = new Face();
      CFJG.addPoint(C);
      CFJG.addPoint(F);
      CFJG.addPoint(J);
      CFJG.addPoint(G);
      
      //DGK
      DGK = new Face();
      DGK.addPoint(D);
      DGK.addPoint(G);
      DGK.addPoint(K);
      
      //DKE
      DKE = new Face();
      DKE.addPoint(D);
      DKE.addPoint(K);
      DKE.addPoint(E);
      
      //EKLH
      EKLH = new Face();
      EKLH.addPoint(E);
      EKLH.addPoint(K);
      EKLH.addPoint(L);
      EKLH.addPoint(H);
      
      //FHLJ
      FHLJ = new Face();
      FHLJ.addPoint(F);
      FHLJ.addPoint(H);
      FHLJ.addPoint(L);
      FHLJ.addPoint(J);
      
      //GJLK
      GJLK = new Face();
      GJLK.addPoint(G);
      GJLK.addPoint(J);
      GJLK.addPoint(L);
      GJLK.addPoint(K);
      
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
    
    void draw()
    {
        scale(50.0);
        for(Face f : faces)
        {
           f.draw(); 
        }
    }
    
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
