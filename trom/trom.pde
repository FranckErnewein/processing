
class Strait{
 
   int xDelta=0;
   int yDelta=0;
   int x;
   int y;
   int interval=0;
   int resetRandomIntervalMin = 5;
   int resetRandomIntervalMax = 50;
   int resetInterval = round(random(resetRandomIntervalMin,resetRandomIntervalMax));
   int r = 4;
   color lineColor = color(0,255,0);
   color aloLarge = color(0,255,0,20);
   color aloThin = color(0,255,0,80);
   color circleFill = color(0,0,0);
   color circleStroke = color(0,255,0);
   color textFill = color(0,255,0);
  
   Strait(){
       x = round(random(0,width));
       y = round(random(0,height));
       randomizeWay();
   }
   
   Strait(int _x, int _y){
       x = _x;
       y = _y;
       randomizeWay();
   }
   
   void randomizeWay(){
       int _xDelta, _yDelta;
       
       if(xDelta < 0) _xDelta = round(random(-1,0));
       else if (xDelta > 0) _xDelta = round(random(0,1));
       else _xDelta = round(random(-1,1));
       
       if(yDelta < 0) _yDelta = round(random(-1,0));
       else if (yDelta > 0) _yDelta = round(random(0,1));
       else _yDelta = round(random(-1,1));

       
       if(_xDelta == 0 && _yDelta == 0){
         randomizeWay();  
       }else{
         xDelta = _xDelta;
         yDelta = _yDelta;
         
         r = round(random(3,8));
         
         fill(circleFill);
         stroke(circleStroke);
         ellipse(x,y,r*2,r*2);
         
         fill(textFill);
         textSize(8);
         text("["+x+","+y+"]", x+r+2,y);
        
         x += xDelta*(r-1);
         y += yDelta*(r-1);
         
         
         
       }
       
       
   }
   
   void display(){
      
       if(interval == resetInterval){
          interval = 0;
          resetInterval = round(random(resetRandomIntervalMin,resetRandomIntervalMax));
          randomizeWay();
       }
       interval++;
      
     
      if( x < 0 || x > width){
         xDelta = -xDelta;
      }
      if( y < 0 || y > height){
         yDelta = -yDelta;
      }
      
      x += xDelta*3;
      y += yDelta*3;
      
      
      
      noStroke();
      fill(aloLarge);
      ellipse(x,y,5,5);
      
      fill(aloThin);
      ellipse(x,y,3,3);
      
      
      stroke(200,255,200);
      point(x,y);
      point(x-xDelta,y-yDelta);
      point(x-xDelta*2,y-yDelta*2);

   }
   
}

ArrayList straits = new ArrayList<Strait>();


float angle=0;

void setup(){
   frameRate(60);
  
   size(1024,700);
   background(0); 
   
   fill(0,255,0);
   textSize(10);
   text("Click to add more line", 10, 10);
   

   
   for(int i=0; i<1; i++){
      straits.add(new Strait());  
   }
   
}

void mousePressed(){
   straits.add(new Strait(mouseX, mouseY)); 
}

void mouseDragged(){
   straits.add(new Strait(mouseX, mouseY)); 
}


void draw(){
 
  
   noStroke();
   fill(0,0,0,4);
   rect(0,0,width,height);
   

   for(int i=0; i<straits.size(); i++){
      Strait s = (Strait)straits.get(i);
      s.display();
   }

}
