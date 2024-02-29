import org.openkinect.freenect.*;
import org.openkinect.processing.*;


boolean state = true;

Kinect kinect;

PImage img;

int minDepth =  150;
int maxDepth = 400;
int x=0;
int y=0;
int count = 0;
int judge = 0;
int k=0;
int l =0;

//hairetu
int [] xm= new int [1000];
int [] ym= new int [1000];
int [] c= new int [1000];

//marunoookisa
int ookisa = 33;

void setup() {
  //size(1300, 1000);
  fullScreen();
  frameRate(30);
  background(255);
  img = loadImage("1271.png");
  image(img, 150, 13);

  kinect = new Kinect(this);
  kinect.initDepth();
}

void draw() {

  int[] rawDepth = kinect.getRawDepth();
  for (int i=0; i<rawDepth.length; i++) {
    if (rawDepth[i] >= minDepth  && rawDepth[i] <= maxDepth && judge == 1) {
      x=int(random(300, 900));
      y=int (random(163, 663));
      fill(#bcd6a6);
      noStroke();
      ellipse(x, y, ookisa, ookisa);
      judge = 0;
      xm[k]=x;
      ym[k]=y;
      c[k]=0;
      k++;
    }
    if (rawDepth[i] >= minDepth  && rawDepth[i] <= maxDepth) {
      count ++;
    }
  }
  if (judge == 0  && count == 0) {
    judge = 1;
  }
  count = 0;
  delay(500);

  for (int j=0; j<k; j++) {
    if (c[j] < 40) {
      c[j]++;
    }
    //    print(c[j]);
    if (c[j]==5) {
      noStroke();
      fill(#708aa3);
      ellipse(xm[j], ym[j], ookisa, ookisa);
    } else if (c[j]==10) {
      noStroke();
      fill(#889f45);
      ellipse(xm[j], ym[j], ookisa, ookisa);
    } else if (c[j]==15) {
      noStroke();
      fill(#ffe6c2);
      ellipse(xm[j], ym[j], ookisa, ookisa);
    } else if (c[j]==20) {
      noStroke();
      fill(#face88);
      ellipse(xm[j], ym[j], ookisa, ookisa);
    } else if (c[j]==25) {
      noStroke();
      fill(#f9b184);
      ellipse(xm[j], ym[j], ookisa, ookisa);
    } else if (c[j]==30) {
      noStroke();
      fill(#fbccc0);
      ellipse(xm[j], ym[j], ookisa, ookisa);
    } else if (c[j]==35) {
      noStroke();
      fill(#fac4c8);
      ellipse(xm[j], ym[j], ookisa, ookisa);
    } else if (c[j]==40) {
      noStroke();
      fill(#f492ac);
      ellipse(xm[j], ym[j], ookisa, ookisa);
    }
  }
}
