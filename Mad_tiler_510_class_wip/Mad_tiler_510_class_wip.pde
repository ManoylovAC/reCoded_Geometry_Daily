/////////////////////////// //<>//
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Don't use without permission
//
// Based on:
// #510 Mad tiler 
// http://geometrydaily.tumblr.com/post/58788031158/510-mad-tiler
//
// Controls:
// leftClick  - rotate individual tiles.
// rightClick - new random composition 
// 
// keys:
// 1 - diagonal lines 1;       ///
// 2 - diagonal lines 2;       \\\
// 3 - vertical lines;         |||
// 4 - cross tiles;            /\/
// 
// 5 - tiles in each second    /|/|\|
// column is vertical, another /|\|/|
// tiles - random;             ||/|/|
// 
// 6 - random diagonal tiles (no vertical);
//
/////////////////////////////////////////////////

int sz = 690;

//int startPos = sz/100*16;
int startPos = 100;
int endPos = sz - startPos;

//float wdrect = (endPos-startPos)/15;
float kf = 1.74; 

float hgrect = 50;
float wdrect = hgrect/kf;

float gip = sqrt((wdrect*wdrect)+(hgrect*hgrect));
float vrStep = hgrect/2;
float hrStep = gip+wdrect;


boolean mclick = true;
ArrayList <Block> blocks;


void setup() {
  size (sz, sz);
  smooth();
  background(240);
//  noLoop();
  setBlocks();
  //  int ch = 0;
  //  for (int y = startPos; y<endPos; y+=vrStep) {
  //
  //    for (int x = startPos; x<=endPos; x+=hrStep) {
  //      if (ch%2==0) {
  //        blocks.add(new Block (x, y, wdrect, hgrect));
  //      }
  //      else if (x+hrStep/2<=endPos) {
  //        blocks.add(new Block (x+hrStep/2, y, wdrect, hgrect));
  //      }
  //    }
  //    ch++;
  //  }
}

void draw() {

   background(240);
  fill(#21708a);
  noStroke();
//  strokeWeight(0.5);
//  stroke(#21708a);


  for (Block i: blocks) {
    if (mousePressed && mclick && i.intersect(mouseX, mouseY)) { //<>//
      mclick = false;
      i.nextAngle();
    }  
    i.display();
  }
  
  

}




void mouseClicked() { //<>//

  if (mouseButton == RIGHT) {
    for (Block i: blocks) {
      i.nextRandomAngle();
    }
  }
  
//  background(240);
mclick = true;
  redraw();
}


void keyPressed( ) {
  int setAngle = 9;
  int corr = 0;

  if (key == '1') {
    setAngle=1;
  }
  if (key == '2') {
    setAngle=2;
  }

  if (key == '3') {
    setAngle=0;
  }

  if (key == '4') {
    setAngle=0;
    corr = 1;
  }

  if (key == '4') {
    setAngle=1;
    corr = 1;
  }

  if (key == '5') {
    setAngle=0;
  }

  if (key == '6') {
    setAngle=0;
    //    corr=1;
  }
  if (key == '7') {
    for (Block i: blocks) {
      i.setHeight(wdrect);
    }
  }

  if (key == '8') { 
    for (Block i: blocks) {
      i.setHeight(wdrect*kf);
    }
  }



  if (setAngle!=9) {
    //    for (Block i: blocks) {
    //      i.settAngle(setAngle);
    //    }
    //  }


    int ch = 0;
    int i = 0;
    for (int y = startPos; y<endPos; y+=vrStep) {
      for (int x = startPos; x<endPos; x+=hrStep) {

        if (key == '5') {
          corr=((int)random(0, 3));
        }
        if (key == '6') {
          setAngle=((int)random(1, 3));
        }

        if (i<blocks.size()) {
          if (ch%2==0) {
            //          println(blocks.size());
            //          println("i = " + i);
            blocks.get(i).setAngle((setAngle+corr)%3);
          }
          else if (x+hrStep/2<=endPos) {
            blocks.get(i).setAngle(setAngle);
          }
        }
        i++;
      }
      ch++;
    }
  }

  if (keyCode == DOWN || keyCode == UP) {
    if (keyCode == DOWN) {
      hgrect-=4;
    }

    if (keyCode == UP) {
      hgrect+=4;
    }

    hgrect = constrain(hgrect, 10, 74);

    wdrect = hgrect/kf;
    gip = sqrt((wdrect*wdrect)+(hgrect*hgrect));
    vrStep = hgrect/2;
    hrStep = gip+wdrect;
    setBlocks();
  }

//  background(240);
  redraw();
}

void setBlocks() {
  blocks = new ArrayList <Block>();

  int ch = 0;
    for (int y = startPos; y<endPos; y+=vrStep) {
      for (int x = startPos; x<endPos; x+=hrStep) {
      if (ch%2==0) {
        blocks.add(new Block (x, y, wdrect, hgrect));
      }
      else if (x+hrStep/2<=endPos) {
        blocks.add(new Block (x+hrStep/2, y, wdrect, hgrect));
      }
    }
    ch++;
  }
}
