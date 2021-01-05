PImage diamond;
PImage dirt;
PImage grass_top, grass_side;
float rotx, roty;

void setup() {
  size(800, 800, P3D);
  diamond = loadImage("diamond.png");
  dirt = loadImage("dirt.png");
  grass_top = loadImage("grass_top.png");
  grass_side = loadImage("grass_side.png");
  textureMode(NORMAL);
}

void draw() {
  background(0);
  
  texturedCube(width/2, height/2, 0, diamond, 100);
  texturedCube(100, height/2, 0, dirt, 100);
  texturedCube(width/2, 100, 0, grass_top, grass_side, dirt, 100); //<>//
}

void texturedCube(float x, float y, float z, PImage texture, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);
  
  noStroke();
  
  beginShape(QUADS);
  texture(texture);
  //top
  //     x, y, z, tx,ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  //bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
  //right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);
  endShape();
  popMatrix();
}

void texturedCube(float x, float y, float z, PImage top, PImage side, PImage bottom, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);
  
  noStroke();
  
  beginShape(QUADS);
  texture(top);
  //top
  //     x, y, z, tx,ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  endShape();
  
  beginShape(QUADS);
  texture(bottom);
  //bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  endShape();
  
  beginShape(QUADS);
  texture(side);
  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
  //right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);
  endShape();
  popMatrix();
}

void ball (float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z);
  rotateX(rotx);
  rotateY(roty);
  stroke(255);
  fill(c);//#F5DFA3
  strokeWeight(3);
  sphere(size);
  popMatrix();
}

void cube(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z);
  
  rotateX(rotx);
  rotateY(roty);
  //rotateZ();
  
  stroke(255);
  strokeWeight(12);
  fill(c);
  box(size);//W H D three dimensional object is always drawn at 0, 0 so need to be translated
  popMatrix();
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY) * 0.01;
  roty = roty + (pmouseX - mouseX) * -0.01;
}
