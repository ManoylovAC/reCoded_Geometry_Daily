/////////////////////////// //<>// //<>// //<>// //<>//
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Don't use without permission
//
// Based on:
// #411 Monument scribble
// http://geometrydaily.tumblr.com/post/47107135240/411-monument-scribble-a-new-minimal-geometric

// Controls:
// MouseClick  - generate new position 
//
// Keys:
// UP   - add parallel 
// DOWN - remove parallel
// Z    - reduces the diameter
// X    - increases the diameter
//
/////////////////////////////////////////////////

int sz = 700;
int brdr = 200;
float [] Xcoord = new float [2];
float [] Ycoord = new float [4];
//int lX = 100;
//int rX = sz - lX;
int amountL = 14;
float hgt;

void setup() {
  size(700, 700);
  noLoop();
}


void draw() {
  background(235);


  //ScribbleLine(100, sz-100);

  //  Scribble(100);
  Scrib(170);
  //  paper();
}




void mousePressed() {


  redraw();
}

void keyPressed() {

  if (key == 'q') {
    amountL-=2;
  }
  if (key == 'w') {
    amountL+=2;
  }

  if (key == 'z') {
  }
  if (key == 'x') {
  }

  amountL = constrain(amountL, 6, 30);
//  hgt = (int)((sz-Xcoord[0])/(amountL+1)* 1.5);
//    hgt = ((sz-brdr)/(amountL-1));
    


  redraw();
}

void paper() {
  strokeWeight(1); 
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(235-40, 235+30), 25);
      rect(i, j, 2, 2);
    }
  }

  for (int i = 0; i<30; i++) {
    fill(random(60, 170), random(100, 170));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}


void ScribbleLine(int in, int in2) {
  Xcoord[0] = in;
  Xcoord[1] = in2;

  //  Xcoord[0] = in;
  //  Xcoord[1] = sz-Xcoord[0];

  hgt = (int)((sz-Xcoord[0])/(amountL+1)* 1.5);

  Ycoord[0] =Xcoord[0];
  Ycoord[1]= Ycoord[0]+hgt;


  strokeWeight(hgt);
  stroke(#333521);
  strokeCap(ROUND);
  line(Xcoord[0], Ycoord[0], Xcoord[1], Ycoord[0]);

  for (int i =0; i<= amountL; ++i) {
    if ((Ycoord[(i+1)%2]+hgt*3> sz-Xcoord[0]) && (i%2==1) ) {
      Ycoord[(i+1)%2] += hgt*5;    
      break;
    }
    if (i==0 || i==amountL) {
      Ycoord[(i+1)%2] = (int)random(Ycoord[i%2]+ hgt*.5, Ycoord[i%2] + hgt*2);
    } 
    else {
      Ycoord[(i+1)%2] = (int)random(Ycoord[i%2]+ hgt*.5, Ycoord[i%2] + hgt);
    }
    line(Xcoord[i%2], Ycoord[i%2], Xcoord[(i+1)%2], Ycoord[(i+1)%2]);
  }
  line(Xcoord[0], Ycoord[1], Xcoord[1], Ycoord[1]);
}



void Scribble(int in) {

  noStroke();
  Xcoord[0] = in;
  Xcoord[1] = sz-Xcoord[0];
  hgt = (int)((sz-Xcoord[0])/(amountL+1)* 1.5);


  fill(#333521);

  Ycoord[0] =Xcoord[0]/2;
  Ycoord[1]= Ycoord[0]+hgt;

  rect(Xcoord[0], Ycoord[0], Xcoord[1] - Xcoord[0], hgt);


  for (int i =0; i<= amountL; ++i) {
    if ((Ycoord[(i+1)%2]+hgt*3> sz-in) && (i%2==1) ) {
      Ycoord[(i+1)%2] =(int)random(Ycoord[(i+1)%2]+ hgt*2, Ycoord[i%2] + hgt*3);  
      break;
    }


    if (i==0 || i==amountL-1) {
      Ycoord[(i+1)%2] = (int)random(Ycoord[i%2]+ hgt*.5, Ycoord[i%2] + hgt*2);
    } 
    else {
      Ycoord[(i+1)%2] = (int)random(Ycoord[i%2]+ hgt*.5, Ycoord[i%2] + hgt);
    }

    //    line(Xcoord[(i+1)%2], (Ycoord[(i+1)%2] + hgt), Xcoord[i%2], (Ycoord[i%2]+hgt));

    quad(Xcoord[i%2], Ycoord[i%2], 
    Xcoord[i%2], (Ycoord[i%2]+hgt), 
    Xcoord[(i+1)%2], (Ycoord[(i+1)%2] + hgt), 
    Xcoord[(i+1)%2], Ycoord[(i+1)%2]);
  }


  rect(Xcoord[0], Ycoord[1], Xcoord[1] - Xcoord[0], hgt);
}


void Scrib(int in) {

  //  noStroke();
  Xcoord[0] = in;
  Xcoord[1] = sz-Xcoord[0];
//  hgt = ((sz-in*2)/(amountL/2*2.5));
  hgt = ((sz-brdr)/(amountL-1));
//hgt = 50;
//  amountL = (int)(500 / hgt);
  hgt = constrain(hgt,18,sz/10);

  float YY=0;
  float YY2=0;
  fill(#333521);

  Ycoord[0] =Xcoord[0]/2;
  Ycoord[1]= Ycoord[0]+hgt;

  rect(Xcoord[0], Ycoord[0], Xcoord[1] - Xcoord[0], hgt);


//  for (int i =0; /*i<= amountL*/ Ycoord[0] < sz-in*2; ++i) {
  for (int i =0; i<= amountL; ++i) {


    if (i==0) {
      Ycoord[(i+1)%2] += hgt*.5;
      YY = random(-hgt/3, +hgt/3);
    } 
    else {
      Ycoord[(i+1)%2] += hgt*1.5;
      YY = random(-hgt/4, +hgt/3);
    }

     if (i != amountL) {
    quad(Xcoord[i%2], Ycoord[i%2] +YY2, 
    Xcoord[i%2], Ycoord[i%2]+hgt +YY2, 
    Xcoord[(i+1)%2], Ycoord[(i+1)%2] + hgt +YY, 
    Xcoord[(i+1)%2], Ycoord[(i+1)%2] + YY);
     }
     
    YY2 = YY;

//    if (Ycoord[0] + hgt >= sz-brdr) {
     if (i == amountL-1) {
      Ycoord[(i+1)%2] += hgt*1.5;
      YY = random(-hgt/4, +hgt/3);
      quad(Xcoord[(i+1)%2], Ycoord[i%2] +YY2, Xcoord[(i+1)%2], Ycoord[i%2]+hgt +YY2, Xcoord[(i)%2], sz-brdr + hgt*2, Xcoord[(i)%2], sz-brdr + hgt );
      quad(Xcoord[(i)%2], sz-brdr + hgt*2, Xcoord[(i)%2], sz-brdr + hgt, Xcoord[(i+1)%2], sz-brdr + hgt, Xcoord[(i+1)%2], sz-brdr + hgt*2);
    }
  }

//    rect(Xcoord[0], Ycoord[0], Xcoord[1] - Xcoord[0], hgt);
}
