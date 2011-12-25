
class Snake {

  color fillcol, col;
  PVector pos;
  float randomMoveDelta = 100;

  Snake() {
    this(width/2, height/2);
  }

  Snake( float x, float y) {
    pos = new PVector(x, y);
    float notblue = random(120, 255);

    int r = round(random(230, 255));
    int g = round(random(110, 255));
    int b = round(random(200, 255));
    r=255;
    //g=255;


    //g = b;

    col = color(r, g, b, random(50, 80));
    fillcol = color(r, g, b, random(70, 80));
    randomMove();
    randomMove();
  }


  void moveTo( float x, float y ) {
    if (x>width) x = width;
    if (x<0) x = 0;
    if (y>height) y = height;
    if (y<0) y = 0;
    //stroke(col);
    noStroke();
    fill(fillcol);
    //strokeWeight(random(0,2));
    float curveRand = 600;
    curve( 
    pos.x+random(-curveRand, curveRand), pos.y+random(-curveRand, curveRand), 
    pos.x, pos.y, 
    x, y, 
    x+random(-curveRand, curveRand), y+random(-curveRand, curveRand)
      );
    stroke(255);
    point(x, y);
    pos.set(x, y, 0);
  }

  void randomMove() {
    randomMoveDelta = random(10, 15);
    moveTo(pos.x+random(-randomMoveDelta, randomMoveDelta), pos.y+random(-randomMoveDelta, randomMoveDelta));
  }
}

class Firefly {
  float x;
  float y;
  PVector pos;
  float r;

  Firefly() {
    this(random(width), random(height));
  }

  Firefly(float x, float y) {
    pos = new PVector(x, y);

    r = random(10, 30);
  }



  void display() {

    noStroke();
    fill(255, 255, 255, 3);
    ellipse(pos.x, pos.y, r, r);
    ellipse(pos.x, pos.y, r/2, r/2);
    ellipse(pos.x, pos.y, r/4, r/4);
    stroke(255, 255, 255, 20);
    point(pos.x, pos.y);
  }
}

ArrayList snakes;
ArrayList fires;
int nbDraw;
boolean clear = false;
//Snake s;

void setup() {
  size(1024, 768); 
  background(0);

  snakes = new ArrayList<Snake>();
  fires = new ArrayList<Firefly>();


  for (int i=0;i<20;i++) {
    fires.add(new Firefly());
  }
  //  s = new Snake();
}



void draw() {

  if (mousePressed) {
  }

  for (int i=0;i<fires.size();i++) {
    Firefly f = (Firefly)fires.get(i);
    f.pos.add( new PVector(-(mouseX-pmouseX)/(30-f.r), -(mouseY-pmouseY)/(30-f.r) ) );
    f.pos.add(new PVector(random(-1, 1), random(-1, 1)));
    f.display();
  }

  //fill(0, 0, 0, 30);
  fill(0, 0, 0, 10);
  noStroke();
  rect(0, 0, width, height);
  new Snake(mouseX, mouseY);
}

