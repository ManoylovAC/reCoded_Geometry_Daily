/////////////////////////// //<>//
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Based on:
// #510 Mad tiler 
// http://geometrydaily.tumblr.com/post/58788031158/510-mad-tiler
//
// Controls:
// mouseClick - new random composition 
// 
// keys:
// UP   - tileSize + 2
// DOWN - tileSize - 2
//
/////////////////////////////////////////////////

int sz = 700;

int startPos = sz/100*15;
int endPos = sz - startPos;

int wdrect = sz/25;
//float wdrect = (endPos-startPos)/15;
//int hgrect = wdrect*2 - (wdrect/5)+0;
//int hgrect = (wdrect-(wdrect/100*13))*2;
float hgrect = wdrect*1.75;

float gip = sqrt((wdrect*wdrect)+(hgrect*hgrect));
float vrStep = hgrect/2;
float hrStep = gip+wdrect;


int [] ang = {
  0, 60, 120
};

void setup() {
  size (sz, sz);
  background(240);
  noLoop();
}

void draw() {

  background(240);
  fill(#21708a);
  noStroke();
  //  stroke(#21708a);

  //  for (int y = startPos; y<endPos ;y+=wdrect) {
  //    for (int x = startPos; x<=endPos ;x+=wdrect*2) {
  //      block(x,y);
  //    }
  //  }

  /*
  int ch = 0;
   for (int y = startPos + startPos/10; y<endPos ;y+=hgrect/2) {
   
   for (int x = startPos + startPos/10; x<=endPos ;x+=wdrect*3+2) {
   if (ch%2==0) {
   block(x, y);
   }
   else {
   block(x+wdrect+wdrect/2+1, y);
   }
   }
   ch++;
   }
   */

  int ch = 0;
  for (int y = startPos; y<endPos ;y+=vrStep) {

    for (int x = startPos; x<=endPos ;x+=hrStep) {
      if (ch%2==0) {
        block(x, y);
      }
      else if (x+hrStep/2<=endPos) {
        block(x+hrStep/2, y);
      }
    }
    ch++;
  }
}


void block(float x, int y) {
  pushMatrix();
  rectMode(CENTER);
  translate(x, y);

  rotate(radians(ang[(int)random(ang.length)]));
  rect(0, 0, wdrect, hgrect);  
  popMatrix();
}

void mouseClicked() {
  redraw();
}


void keyPressed( ) {
  if (keyCode == DOWN) {
    wdrect-=2;
  }

  if (keyCode == UP) {
    wdrect+=2;
  }


  wdrect = constrain(wdrect, 5, width/15);

  hgrect = wdrect*1.75;
  gip = sqrt((wdrect*wdrect)+(hgrect*hgrect));
  vrStep = hgrect/2;
  hrStep = gip+wdrect;


  //  startPos = sz/100*15;
//  endPos = sz - startPos;


  redraw();
}

