
class Particule {
  float x, y, r, speed;
  color col;
  PVector location, velocity, gravityPoint;

  Particule( float _x, float _y, float _radius, color _color) {
    //x = _x; y = _y;
    r = _radius; 
    col = _color;
    speed = 1;
    location = new PVector(_x, _y);
    velocity = new PVector(speed, speed);
    gravityPoint = new PVector(width/2,height/2);

  }

  Particule( float _x, float _y ) {
    this( _x, _y, random(5, 15), color(random(100, 255), random(100, 255), random(100, 255)) );
  }

  Particule() {
    this( random(0, width), random(0, height) );
  }
  
  void setGravityPoint( float _x, float _y ){
     gravityPoint = new PVector(_x, _y);
  }
  
  void unsetGravity(){
     gravityPoint = null;
  }

  void display() {
    stroke(col);
   //velocity.div(10);
    
    if(gravityPoint == null){
      velocity.mult(0.95);
    }else{
      velocity.add( PVector.mult(PVector.sub(gravityPoint, location), 0.05) );  
      stroke(255,255,255,20);
      strokeWeight(1);
      //line(location.x,location.y, mouseX, mouseY);
    }
    

    
  
    location.add( PVector.div(velocity, 10) );
    
    
    //line(location.x,location.y,velocity.x,velocity.y);

    noStroke();
    int mx = 10;
    if(location.x > width || location.x < 0){
      velocity.x = -velocity.x;
    }
    if(location.y > height || location.y < 0){
      velocity.y = -velocity.y;
    }
    strokeWeight(2);
    for (int i=0;i<mx; i++) {
      color c = color(red(col-i*5), green(col-i*5), blue(col-i*5), mx );
      fill( c );
      
      stroke(color(red(col+100), green(col+100), blue(col+100)));
      point(location.x,location.y);
      noStroke();
      ellipse(location.x, location.y, (mx-i)*r/3, (mx-i)*r/3);
    }
  }
}

class Cloud{
    
   ArrayList particules;
 
   Cloud(int nb){
     particules = new ArrayList<Particule>();
     for(int i=0;i<nb; i++){
        addParticule(); 
     }
   }
   
  
   void addParticule(){
       particules.add(new Particule());
   }
   
   void display(){
      PVector mouse = new PVector(mouseX, mouseY);
      for(int i=0; i<particules.size(); i++){
          
         Particule p = (Particule)particules.get(i);
         
         if( PVector.dist( mouse, p.location ) < 300 ){
            if(mousePressed){
              p.setGravityPoint( random(0,width), random(0,height) );
            }else{
              p.setGravityPoint( mouse.x, mouse.y );
            }
         }else{
            p.unsetGravity(); 
         }           
         
         
        
         p.display();
      }
   }
}


Particule p;
Cloud cloud;

void setup() {
  background(0);
  size(1024, 768);
  //p = new Particule(width/2, height/2);
  cloud = new Cloud(40);
}

void draw() {
  background(0);
  //fill(0,0,0,95);
  //rect(0,0,width,height);
  cloud.display();
}




