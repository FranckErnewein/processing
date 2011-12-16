

void setup() {

  size(1024, 768);
  background(0);

}

float randomX(){
  return random(-width/2, width*1.5);
}

float randomY(){
  return random(-height/2, height*1.5);
}


int count=0;

void draw() {
  count++;
  if(count > 5){
    fill(0,0,0,25);
    noStroke();
    rect(0,0,width,height);
    count=0;
  }
  
  
  

   stroke(0,0,0,90);
   noFill();
   for(int i=0; i<50; i++){
      float delta = random(50,300);
      curve(
      mouseX + random(-delta, delta), mouseY + random(-delta, delta),
      mouseX + random(-delta, delta), mouseY + random(-delta, delta), 
      mouseX + random(-delta, delta), mouseY + random(-delta, delta), 
      mouseX + random(-delta, delta), mouseY + random(-delta, delta)
      );
      
   }
   fill(0,0,0,20);
   float rad = random(30,120);
   ellipse(mouseX,mouseY,rad,rad);
   noFill();
  
  noFill();
  
  for(int i=0;i<120;i++){
     float onWhite = random(0,120);
     stroke(255, onWhite, onWhite, random(20, 40)); 
     curve(
     randomX(), randomY(), 
     randomX(), randomX(), 
     randomX(), randomY(), 
     randomX(), randomY()
    );
  }
  

}

