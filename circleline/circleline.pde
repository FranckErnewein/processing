class CircleLine {

  float angle = 22;
  float r = 50;
  float oldAngle = 22;
  float oldR = 0;
  int way = 0;
  int maxKeyFrame = 100;
  int keyFrame = 0;
  color col;
  boolean firstChange = true;
  float maxR;
  float minR = 20;
  float deltaR = 1;
  float deltaAngle = 2;

  float angleDelta;

  CircleLine() {
    maxR = dist(0,0,width/2,height/2);
    keyFrame = round(random(maxKeyFrame-20));
    
    r = round(random(minR, maxR/2));
    angle = random(PI*2);
    col = color(
    round(random(255)), 
    round(random(10)), 
    round(random(0, 30)),
    60
      );
    
    
    oldR = r;
    oldAngle = angle;

    changeWay();
  }

  void changeWay( int value ) {
    way = value;
    fill(255);
    //noStroke();
    stroke(red(col), green(col), blue(col), 60);
    //noFill();
    if (!firstChange) {
      //ellipse(r*cos(angle), r*sin(angle), 6, 6);
    }
    else {
      firstChange = false;
    }
  }

  void changeWay() {
    if (way > 1) {
      changeWay(round(random(1)));
    }
    else {
      changeWay(round(random(2, 3)));
    }
  }

  void display() {

    keyFrame++;
    if (keyFrame > maxKeyFrame) {
      changeWay();
      keyFrame = round(random(maxKeyFrame-20));
    }

    if ( way < 2 ) {
      r = (way == 1)? oldR + deltaR : oldR - deltaR ;
      if (r > maxR && way == 1) changeWay(0);
      else if ( r < minR && way == 0 ) changeWay(1);
    }
    else {
      angle =(way == 2)? oldAngle + deltaAngle/r : oldAngle - deltaAngle/r;
    }

    stroke(col);
    line( oldR*cos(oldAngle), oldR*sin(oldAngle), r*cos(angle), r*sin(angle) );
    oldAngle = angle;
    oldR = r;
  }
}






ArrayList circles = new ArrayList<CircleLine>();

void setup() {
  size(1024, 768); 
  background(255);
  smooth();
  for (int i=0; i<15; i++) {
    circles.add(new CircleLine());
  }
}

void draw() {
  fill(255, 255, 255, 2);
  noStroke();
  //rect(0, 0, width, height);

  

  if(mousePressed){
    if(mouseButton == LEFT){
       circles.add(new CircleLine());      
    }else{
       circles.clear(); 
       fill(255,255,255,80);
       noStroke();
       rect(0,0,width,height);
    }
  }

  translate(width/2, height/2);

  for (int i=0; i<circles.size(); i++) {
    CircleLine c = (CircleLine)circles.get(i);
    c.display();
  }
}



