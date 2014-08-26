/////////////////////////// //<>// 
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// browser version
// Don't use without permission
//
// Based on:
// #37 Son of Ra
// http://geometrydaily.tumblr.com/post/17155048079/37-son-of-ra-a-new-minimal-geometric
//
// Controls:
// MouseClick  - redraw 
//
// Keys:
// UP  - add one ring.
// DOWN - remove one ring 
//
/////////////////////////////////////////////////

int sw = 2;           
int sz = 600;
float diam = 600/1.8;
float start = diam - diam/2;
int iter = 15;
float step = diam/iter;
int [] ch = {-1,1};

int bgColor = 235;

void setup() {
  size(sz, sz);
  colorMode(HSB, 100, 100, 100);
  noLoop();
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(0, 0, 90);
//  noFill();
start = diam - diam/2; 




  for (int i = 0; i<iter; ++i) {
      pushMatrix();
      translate(width/2, start);
  rotate(radians(random(10, 20)* ch[(int)random(ch.length)]));
//    strokeWeight(random (diam/9, diam/5));
//    stroke(random(0, 100), random(80, 100), random(20, 80), 50);  // browser value
//    stroke(random(0, 100), random(80, 100), random(20, 80), 130);   // normal value
 
 fill(random(0, 100), random(80, 100), random(20, 80), 130); 
  rect(0,0,sz,90);
  start+= step + random(-step/2, step/2);
    popMatrix();
  } //<>//



  stroke(0, 0, 90);
  noFill();
  strokeWeight(300);
  ellipse(width/2-7, height/2, (diam+sz/2), (diam+sz/2));

//  paper(10);  // browser value
  paper(30);  // normal value
}

void mousePressed() {
  redraw();
}

void keyPressed() {
  if (key == 'z') {
    iter--;
  }
  if (key == 'x') {
    iter++;
  }
  iter = constrain(iter, 5, 30);
  redraw();
}

void paper(int in_val) {
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(85-10, 85+10), in_val);
      rect(i, j, 2, 2);
    }
  }

  for (int i = 0; i<30; i++) {
    fill(random(40, 60), random(in_val*2.5, in_val*3));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}
