

class Polygone{
  
  Polygone(){
    x=0;
    y=0;
    z=0;
    r=80;
    step=10;
    
    points = new HashMap();
     
  }
  
  float x;
  float y;
  float z;
  float r;
  HashMap points;
  
  int step;
  
  void display(){
    
    float delta = PI/step;
      
      for(int i=0;i<step; i++ ){

         for(int j=0; j<step; j++){
           
           Peak p1 = createPoint(i,j);
           Peak p2 = createPoint(i+1,j);
           Peak p3 = createPoint(i,j+1);
           Peak p4 = createPoint(i+1,j+1);           
           
           /*
           Peak p1 = new Peak(i,j, r);
           Peak p2 = new Peak(i+delta,j, r);
           Peak p3 = new Peak(i,j+delta, r);
           Peak p4 = new Peak(i+delta,j+delta, r);
           */
           
           //displayPoint(p);
           /*
           linePoints(p1, p2);
           linePoints(p1, p3);
           linePoints(p2, p3);
           */
           
           drawFace(p1,p2,p3,p4);

         }  
        
      }
    
  }
  
  Peak getPoint(int av, int ah){
     
      Peak p = (Peak)points.get(av+'-'+ah);
      
      println(av);
      println(ah); 
      println(p);
      if(p == null){
        createPoint(av, ah);
      }
      
      
      return (Peak)points.get(av+'-'+ah);
      
      
  }
  
  Peak createPoint(int av, int ah){
    Peak p = new Peak(PI*2/step*av, PI*2/step*ah,r);
    points.put(av+'-'+ah, p);
    return p;
  }
  
  void displayPoint(Peak p){
    
      //point(x+p.x, y+p.y, z+p.z);
      line(x,y,z, x+p.x, y+p.y, z+p.z);
  }
  
  void linePoints(Peak p1, Peak p2){
     line(x+p1.x, y+p1.y, z+p1.z,  x+p2.x, y+p2.y, z+p2.z);
  }
  
  void drawFace(Peak p1, Peak p2, Peak p3, Peak p4){
      //stroke(255,255,100,80);
      fill(100,100,100,80);
      beginShape();
      vertex(x+p1.x, y+p1.y, z+p1.z);
      vertex(x+p2.x, y+p2.y, z+p2.z);
      vertex(x+p4.x, y+p4.y, z+p4.z);
      vertex(x+p3.x, y+p3.y, z+p3.z);
      endShape();
  }
  
}

class Peak{

   float x;
   float y;
   float z; 
   
   float av;
   float ah;
   float r;
   
   Peak( float av, float ah, float r ){
       this.av = av;
       this.ah = ah;
       this.r = r;
       calcul();
   }
   
   void calcul(){
       x = cos(av) * cos(ah) * r;
       y = sin(av) * cos(ah) * r;
       z = sin(ah) * r;
   } 
  
   void write(){
      String coor = "["+round(x)+", "+round(y)+", "+round(z)+"]";
      text( coor, x, y, z);
   }
}

class FloatPeak extends Peak{
    float maxRadius;
    float minRadius=0;
    int way=1;
  
    FloatPeak(float av, float ah, float r, float _maxRadius){
       super(av, ah, r);
       maxRadius = _maxRadius;
       
    }
    
    void bounce(){
       if(r > maxRadius || r < 10){
          way = -way;       
       }
       r += way * random(0.1,1);
       calcul();
    }
    
    void display(){
        point(x,y,z);
    }
    
}

class Connection{
  
  Peak p1;
  Peak p2;

  
  Connection(Peak _p1, Peak _p2){
      p1 = _p1;
      p2 = _p2;
  }
  
  void display(){
      //stroke(200,200,255,30);
      //strokeWeight(weight);
      //line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
      
      curve( 
        p1.x*2, p1.y*2, p1.z*2,  
        p1.x, p1.y, p1.z,     
        p2.x, p2.y, p2.z,
        p2.x*2, p2.y*2, p2.z*2
        );
      
  }
  
}

class Cloud{

  
    ArrayList pts;
    ArrayList links;
    
    int maxRadius = 300;
    int minRadius = 20;
    
    Cloud(){
      pts = new ArrayList<Peak>();
      links = new ArrayList<Connection>();
    }
    
    Cloud( int nbPoint ){
       this();
       for(int i=0; i<nbPoint; i++){
          addPoint(); 
       }

    }
    
    void addPoint(){
       FloatPeak p = new FloatPeak( random(0,PI*2), random(0,PI*2), random(minRadius, maxRadius), maxRadius );
       addPoint( p );
    }
    
    void addPoint(Peak p){
       for(int i=0; i<pts.size(); i++){
           Peak p1 = (Peak)pts.get(i);

           //if( p1.av + p.av < PI*2 || p1.ah + p.ah < PI*2 ){
             links.add( new Connection( p1 , p ) );
           //}
       }
       pts.add( p );
    }
    
    void display(){
       //p.explode();
       
       stroke(200,200,255);
       for(int j=0; j<pts.size(); j++){
            FloatPeak p = (FloatPeak)pts.get(j);
            p.bounce();
            p.display();
       }
       
       
       stroke(200,200,255,20);
       noFill();
       for(int i=0; i<links.size(); i++){
            
            Connection l = (Connection)links.get(i);
            l.display(); 
       }
    }
  
  
}

float rx=0;
float ry=0;
float rz=0;

Polygone poly;
Cloud cloud;

void setup(){
   size(1000,600, P3D);
//   lights();
   //smooth();
   //rotateX(0.3);
   //rotateY(0.2);   
   
   poly = new Polygone();
   cloud = new Cloud(25);
   

}

void draw(){
  
  background(0);
  fill(200,200,255);
  textSize(12);
  textMode(SCREEN);
  text("drag to rotate", 2, 12);
  /*
  rx+=0.001;
  ry+=0.01;
  rz+=0.003;
  */
  translate(width/2, height/2);
  
  
  //createGradient(0,0,height/2, color(0,0,0) ,color(0,0,100) );
  

  if(!mousePressed){
      
      if(abs(deltaRX) > 0.01 ){
         deltaRX = deltaRX*0.9;
      }else{
         deltaRX = 0 ;
      }
      if(abs(deltaRY) > 0.01){
         deltaRY = deltaRY*0.9;
      }else{
         deltaRY = 0 ;
      }
  }

  rx+=deltaRY;
  ry+=deltaRX;

  rotateZ(rz);
  rotateX(rx);
  rotateY(ry);
  
  
  fill(100,100,100);
  textSize(8);
  //poly.display();
  cloud.display();
};


float oldMouseX;
float oldMouseY;

void mousePressed(){
  oldMouseX = mouseX;
  oldMouseY = mouseY;
}

float deltaRX;
float deltaRY;

void mouseDragged(){
   deltaRX = (mouseX - oldMouseX) / width / (PI*2);
   deltaRY = (mouseY - oldMouseY) / height / (PI*2);
}



