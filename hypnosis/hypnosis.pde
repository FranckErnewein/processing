void setup() {
  size(1024, 768, P3D);
}

float rx=0;
float ry=0;

void draw() {
  translate(width/2, height/2);
  background(random(50, 120), random(120), 120);







  for (int a=0;a<3;a++) {
    rx+=0.005;
    ry+=0.015;
    rotateX(rx);
    rotateZ(ry);


    for (int j=0;j<30;j++) {
      stroke(0);

      //strokeWeight(random(1,10));
      stroke(random(50, 255), random(255), 255);
      if (j<14) {
        float r = random(30, 50);
      }
      else {
        r=50;
      }
      fill(random(50, 110), random(110), 110);
      ellipse(0, 0, r*j, r*j);
      //        ellipse(0,0, 600,50);
    }
  }
}

