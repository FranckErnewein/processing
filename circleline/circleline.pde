class CircleLine{
  
  float angle = 22;
  float r = 50;
  
  float angleDelta;
  
  CircleLine(){
        
  }
  
  void display(){
    r+=0.1;
    
    float
    
    /*
    float angle2 = angle + 0.0002*r;
    stroke(0,0,0,100);
    line( r*cos(angle), r*sin(angle), r*cos(angle2), r*sin(angle2) );
    angle = angle2;
    */
  }
  
  void trunIn(){
     r += 0.1;   
  }
  
  void trunOut(){
    
  }
  
  void moveToExt(){
    
  }
  
  void moveToInt(){
    
  }
    
}


void setup(){
  size(600,600); 

}

CircleLine c = new CircleLine();

void draw(){
    translate(width/2, height/2);
  c.display();
}


