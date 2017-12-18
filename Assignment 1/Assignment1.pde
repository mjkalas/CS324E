void setup() {
size(500, 500);
}

void draw (){
  {background(#92DB8E);
  stroke(#815735);
  strokeWeight(3);
  fill(#5A3F29);
  rect(0, 300, 500, 150);
  rect(0, 450, 50, 50);
  rect(450, 450, 50, 50);
  }
  
  {stroke(#5A2912);
  strokeWeight(8);
  fill(#A29D9A);
  ellipse(200, 100, 150, 225);
  line(200, 0, 200, 212);
  line(125, 100, 275, 100);
  }
  
  {stroke(#1175F5);
  strokeWeight(5);
  fill(#498FF0);
  rect(100, 200, 300, 150);
  }
  
  {stroke(#FFFFFF);
  fill(#FFFFFF);
  quad(175, 150, 150, 195, 350, 195, 375, 155);
  }
  
  {stroke(#988400);
  strokeWeight(4);
  fill(#988337);
  rect(350, 300, 75, 75);
  fill(#5A3F29);
  strokeWeight(8);
  bezier(425, 315, 475, 300, 475, 400, 425, 350);
  }

}
