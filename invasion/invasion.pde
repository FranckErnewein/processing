
class Snake{
   
   color col;
   PVector pos;
   float randomMoveDelta = 30;
    
   Snake(){
     this(width/2,height/2); 
   }
    
   Snake( float x, float y){
     pos = new PVector(x, y);
     float notblue = random(120,255);
    
     col = color(notblue, notblue, 255, random(50,100));
   }
   
   
   void moveTo( float x, float y ){
      if(x>width) x = width;
      if(x<0) x = 0;
      if(y>height) y = height;
      if(y<0) y = 0;
      stroke(col);
      strokeWeight(random(0,2));
      line(pos.x,pos.y, x,y);
      pos.set(x, y, 0);
   }
   
   void randomMove(){
      randomMoveDelta = random(2,5);
      moveTo(pos.x+random(-randomMoveDelta,randomMoveDelta),pos.y+random(-randomMoveDelta,randomMoveDelta));
   }
  
  
}


ArrayList snakes;
int nbDraw;
boolean clear = false;
//Snake s;

void setup(){
  size(1024,768); 
  background(0);
  snakes = new ArrayList<Snake>();
  initBall(width/2, height/2);
//  s = new Snake();
}



void initBall(float x, float y){
  clear = true;  
  
  for(int i=0;i<100;i++){
    snakes.add( new Snake(x, y) ); 
  }
  nbDraw =0;
}

void draw(){
  
  if(mousePressed){
    
  }
  
  nbDraw++;

  if(clear){

      fill(0,0,0,30);
      rect(0,0,width,height);
      if(nbDraw == 50){
         clear = false;
         background(0);
      }
    
  }else{
    
    snakes.add(new Snake(mouseX, mouseY)); 
    for(int i=0;i<snakes.size();i++){
      Snake s = (Snake)snakes.get(i); 
      s.randomMove();
      s.randomMove();
      s.randomMove();    
    }
    
    if(nbDraw > 400){
         for(int j=0; j<10; j++){
             if(snakes.size()>0){
               snakes.remove(snakes.size()-1);
             }else{
               initBall(mouseX, mouseY);
             }
             
         }
    }
    
    fill(0,0,0,2);
    //rect(0,0,width,height);
  }
}


