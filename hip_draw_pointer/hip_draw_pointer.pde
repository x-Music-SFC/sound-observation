Table star; //csvファイルを読み込んだと起用のTableを作っておく
int strNum;
int xLine;
int yLine;
int zLine;

import peasy.*; //ライブラリを取込  
PeasyCam cam;   //カメラワーク操作のためのオブジェクトを格納する変数を定義  

void setup() {
  star = loadTable("mdata_starLine.csv"); //csvファイルを読み込む
  strNum = star.getRowCount(); //csvファイルの行数を数える
  println(strNum + "stars");
  
  size(1000, 1000, P3D);  
  
  cam = new PeasyCam(this, 100); // カメラワーク操作オブジェクト。親オブジェクトと距離?を指定  
  cam.setMinimumDistance(50); // カメラの最小距離定義  
  cam.setMaximumDistance(500); // カメラの最大距離定義  
}

void draw(){
  key();
  //3次元空間に描画する
  background(0);
  noStroke();
  fill(0, 104, 183);
  
  translate(width/2, height/2);
  sphere(10);
  stroke(255, 0, 0);
  line(0,0,0, xLine,yLine,zLine);
  for (int i = 0; i < strNum; i++) {
    float theta = (star.getFloat(i, 2)*15 + star.getFloat(i, 3)/4 + star.getFloat(i, 4)/240) * PI/180;
    float phi = (star.getFloat(i, 5) + star.getFloat(i, 6)/4 + star.getFloat(i, 7)/240) * PI/180;
    float dist = (1/star.getFloat(i,9)) * 8000;

    strokeWeight(star.getFloat(i, 8));
    stroke(255,255,255);
    point(dist*cos(theta)*cos(phi), dist*sin(phi), dist*sin(theta)*cos(phi));
    //pushMatrix();
    //translate(dist*cos(theta)*cos(phi), dist*sin(phi), dist*sin(theta)*cos(phi));
    //sphere(star.getFloat(i, 9)/4);
    //popMatrix();
  }
}

void key(){
  if (keyPressed) 
  {
    print("i");
    print(" ,");
    println("l");
    if (keyCode == UP)
    {
      zLine += 1;
    }
    if (keyCode == DOWN)
    {
      zLine -= 1;
    }
    if (keyCode == RIGHT)
    {
      xLine += 1;
    }
    if (keyCode == LEFT)
    {
      xLine -= 1;
    }
  }
}
