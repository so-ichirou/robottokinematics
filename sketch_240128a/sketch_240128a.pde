float base=60;      //胴体
float arm1=40;      //肩から肘
float arm2=40;      //肘から手
float arm3=20;      //手
float armW1 = 10;
float armW2 = 10;
float armW3 = 5;
int angle0 = 0;      //体角度(z)
int angle1 = 0;      //肩角度(x)
//float angle2 = 0;    //肘角度(x)
int angle3 = 0;      //手角度(x)
float dif = 1.0;
float V = 10;      //mogura体積
int x ;


void setup(){
  size(1000,1000,P3D);
  //background(255);
  camera(100, 180, 180, 0, 0, 0, 0, 0, -1);
  frameRate(60);
  noStroke();  
}

void draw(){
  x = frameCount % 900; // 剰余
  background(255);
  //オートマ
  if(keyPressed){   //胴体調整
   if(key == 'a'){
     if(angle0%360 !=90){
        angle0 +=1;
     }
     if(angle1%180 !=45){
     angle1 +=1;
     angle3 +=1;
   }
   }
  if(key == 'b'){
     if(angle0%360 !=0){
        angle0 +=1;
     }
     if(angle1%180 !=45){
     angle1 +=1;
     angle3 +=1;
   }
  }
  if(key == 'c'){
    if(angle0%360 !=270){
        angle0 +=1;
     }
     if(angle1%180 !=45){
     angle1 +=1;
     angle3 +=1;
   }
  }
  if(key == 'o'){
    angle1 =0;
    angle3 =0;
  }
 //マニュアル
    if(keyCode == RIGHT){
      angle0 =angle0 + 1;  
    }
    if(keyCode == LEFT){
      angle0 =angle0 + -1;
    }
    if(keyCode == UP){      //肩、肘調整
      angle1 =angle1 + 1;
      angle3 =angle3 + 1;
    }
    if(keyCode == DOWN){
      angle1 =angle1 + -1;
      angle3 =angle3 + -1;
    }
  }

pushMatrix();
  translate(0,0,base/2);  //  胴体
  rotateZ(radians(angle0));
  fill(175);
  box(10,10,base);
  
  translate(0,0,base/2-armW1/2);    //肩回転
  rotateX(radians(angle1));
  translate(10,arm1/2-armW1/2,0); //肩   
  fill(150); 
  box(armW1,arm1,armW1);
  
  translate(-armW2,arm1/2-armW2/2,0);      //肘回転
  rotateX(radians(angle1));      
  translate(0,arm1/2-armW2/-arm2/2,0);      //肘
  fill(125);
  box(armW2,arm2,armW2);
  
  translate(-armW2/2-armW3/2,arm2/2-armW3/2,0);
  rotateX(radians(angle3));      //手
  translate(0,-arm3/2+arm2/2-armW3/2,0);
  fill(100);
  box(armW3,arm3,armW3);
popMatrix();

  box(20);
  
//mogura
pushMatrix();      //mogura0
 translate(-2.5-V/2,70+1.5*V,60-V);
 fill(255);
 box(V);
popMatrix();

pushMatrix();      //mogura90
 translate(-70-1.5*V,-2.5-V/2,60-V/2);
  fill(255);
  box(V);
popMatrix();

pushMatrix();      //mougra-90
 translate(70+1.5*V,2.5+V/2,60-V/2);
 fill(255);
 box(V);
popMatrix();


if (x < 300) { // 通常0未満にはならない
 pushMatrix();      //mogura0
 translate(-2.5-V/2,70+1.5*V,60-V);
 fill(198,59,6);
 box(V);
popMatrix();
  } else if (x < 600) { // ↑のifに入っていないってことは300以上
pushMatrix();      //mogura90
 translate(-70-1.5*V,-2.5-V/2,60-V/2);
  fill(198,59,6);
  box(V);
popMatrix();
  } else if (x < 900) { // ↑のifに入っていないってことは600以上
pushMatrix();      //mougra-90
 translate(70+1.5*V,2.5+V/2,60-V/2);
 fill(198,59,6);
 box(V);
popMatrix();
  }
}
